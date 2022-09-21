#!/usr/bin/env python3
"""
Module Docstring
"""

__author__ = "Your Name"
__version__ = "0.1.0"
__license__ = "MIT"


import sys
from datajob.etl.extract.corona_api import CoronaApiExtractor
from datajob.etl.extract.corona_vaccine import CoronaVaccineExtractor
from datajob.etl.transform.corona_patient import CoronaPatientTrasformer
from datajob.etl.transform.corona_vaccine import CoronaVaccineTransformer
from datajob.datamart.co_popu_density import CoPopuDensity
from datajob.datamart.co_vaccine import CoVaccine
# transform과정의 경우 spark를 올리는데에 시간이 더 오래걸리기 때문에 직렬로 진행할거임
# 하지만 extract=크롤링의 경우 병렬적으로 하는것이 더 유리함 -> 에어플로우로 개발


def trasform_execute():
    CoronaPatientTrasformer.transform()
    CoronaVaccineTransformer.transform()


def datamart_execute():
    CoPopuDensity.save()
    CoVaccine.save()


works = {
    'extract': {
        'corona_api': CoronaApiExtractor.extract_data,
        'corona_vaccine': CoronaVaccineExtractor.extract_data
    },
    'transform': {
        'execute': trasform_execute,
        'corona_patient': CoronaPatientTrasformer.transform,
        'corona_vaccine': CoronaVaccineTransformer.transform
    },
    'datamart': {
        'execute': datamart_execute,
        'co_popu_density': CoPopuDensity.save,
        'co_vaccine': CoVaccine.save
    }
}

if __name__ == "__main__":

    args = sys.argv
    print(args)

    # main.py 작업(extract, transform, datamart) 저장할 위치(테이블, 트랜잭션)
    # 매개변수 2개
    if len(args) != 3:
        raise Exception('2개의 전달인자가 필요합니다.')

    if args[1] not in works.keys():
        raise Exception('첫번째 전달인자가 잘못 되었습니다.' + str(works.keys()))

    if args[2] not in works[args[1]].keys():
        raise Exception('두번째 전달인자가 잘못 되었습니다.' + str(works[args[1]].keys()))

    work = works[args[1]][args[2]]
    work()
