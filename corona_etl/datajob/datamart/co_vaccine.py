from infra.jdbc import DataMart, DataWarehouse, find_data, save_data
from pyspark.sql.functions import col, ceil


class CoVaccine:

    vaccine = find_data(DataWarehouse, 'CORONA_VACCINE')
    popu = find_data(DataWarehouse, 'loc')
    patients = find_data(DataWarehouse, 'corona_patients')

    def save(cls):

        vaccine = cls.__pivot_vaccine_df()
        vac_rate = cls.__calc_vac_rate(vaccine)
        save_data(DataMart, vac_rate, 'CO_VACCINE')

    def __calc_vac_rate(cls, vaccine):
        vac_rate = vaccine.join(cls.popu, on='loc') \
            .join(cls.patients, on='loc') \
            .select('loc', cls.patients.STD_DAY,
                    ceil(col('v1')/col('population')
                         * 100).alias('V1TH_RATE'),
                    ceil(col('v2')/col('population')
                         * 100).alias('V2TH_RATE'),
                    ceil(col('v3')/col('population')
                         * 100).alias('V3TH_RATE'),
                    ceil(col('v4')/col('population')
                         * 100).alias('V4TH_RATE'),
                    'qur_rate')

        return vac_rate

    def __pivot_vaccine_df(cls):
        pd_vaccine = vaccine.to_pandas_on_spark()
        pd_vaccine = pd_vaccine.pivot_table(
            index=['LOC', 'STD_DAY'], columns='V_TH', values='V_CNT')
        pd_vaccine = pd_vaccine.reset_index()
        vaccine = pd_vaccine.to_spark()
        return vaccine
