from infra.jdbc import DataWarehouse, save_data
from pyspark.sql import Row
from infra.spark_session import get_spark_session
from infra.util import cal_std_day


class CoronaVaccineTransformer:
    file_name = '/corona_data/vaccine/corona_vaccine_' + \
        cal_std_day(1) + '.json'

    @classmethod
    def transform(cls):
        vaccine = get_spark_session().read.json(cls.file_name, multiLine=True)
        data = cls.__generate_rows(vaccine)
        vaccine_data = get_spark_session().createDataFrame(data)
        vaccine_data = cls.__stack_dataframe(vaccine_data)
        save_data(DataWarehouse, vaccine_data, 'CORONA_VACCINE')

    @classmethod
    def __stack_dataframe(cls, vaccine_data):
        # column을 row로 : stack
        # row를 column : pivot

        # sql의 dataframe -> pandas의 dataframe
        pd_vaccine = vaccine_data.to_pandas_on_spark()
        pd_vaccine = pd_vaccine.set_index(
            ['loc', 'std_day'])  # 인덱스로 설정한 컬럼은 stack되지 않음
        pd_vaccine = pd_vaccine.stack()  # 현재 series
        pd_vaccine = pd_vaccine.to_dataframe('V_CNT')  # 다시 df로 변환
        pd_vaccine

        # 멀티 인덱스를 다시 뜯어줌
        # print(pd_vaccine.index)
        pd_vaccine = pd_vaccine.reset_index()  # 숫자 인덱스로 변환
        # print(pd_vaccine.index)

        # spark모양 판다스로 다시 변환
        pd_vaccine = pd_vaccine.rename(columns={'level_2': 'V_TH'})
        vaccine_data = pd_vaccine.to_spark()

        vaccine_data = vaccine_data.drop('level_0')
        vaccine_data = vaccine_data.drop('index')
        return vaccine_data

    @classmethod
    def __generate_rows(cls, vaccine):
        data = []
        for r1 in vaccine.select(vaccine.data, vaccine.meta.std_day).toLocalIterator():
            for r2 in r1.data:
                # row 객체를 만들기 위해 dict 생성
                # ** 파이썬 압축해제 키워드
                # **kwargs   => 여러 쌍의 키워드 args 가 넘어오면 받아서 dictionary로 반환
                # fnc(**dict) => dict에 있는 key-value 값들이 여러쌍의 kwargs  형태로 함수에 전달
                temp = r2.asDict()
                temp['std_day'] = r1['meta.std_day']
                data.append(Row(**temp))
        return data
