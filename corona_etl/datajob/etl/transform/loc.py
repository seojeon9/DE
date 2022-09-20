from infra.jdbc import DataWarehouse, save_data
from infra.spark_session import get_spark_session
from pyspark.sql.functions import col, count


class LocTransformer:

    AREA = get_spark_session().read.csv(
        '/corona_data/loc/sido_area.csv', encoding='CP949', header=True)
    POPU = get_spark_session().read.csv(
        '/corona_data/loc/sido_population.csv', encoding='CP949', header=True)
    FACILITY = get_spark_session().read.csv(
        '/corona_data/loc/전국다중이용시설.csv', encoding='CP949', header=True)

    @classmethod
    def transform(cls):
        # loc 데이터 저장
        area_pop = cls.__join_area_popu()
        fac_cnt = cls.__calc_fac_cnt()
        area_pop_fac = cls.__join_area_fac(area_pop, fac_cnt)
        save_data(DataWarehouse, area_pop_fac, 'LOC')

    @classmethod
    def __join_area_fac(cls, area_pop, fac_cnt):
        area_pop_fac = area_pop.join(fac_cnt, on='LOC')
        return area_pop_fac

    @classmethod
    def __calc_fac_cnt(cls):
        fac_cnt = cls.FACILITY.groupBy(col('광역').alias(
            'LOC')).agg(count('*').alias('FACILITY_CNT'))

        return fac_cnt

    @classmethod
    def __join_area_popu(cls):
        area_pop = cls.AREA.join(cls.POPU, on='loc')
        area_pop = area_pop.select(col('loc').alias('LOC'), col(
            'area').alias('AREA'), col('total').alias('POPULATION'))

        return area_pop
