import unittest
from datajob.etl.extract.corona_api import CoronaApiExtractor


class MTest(unittest.TestCase):
    def test1(self):
        CoronaApiExtractor.extract_data()


if __name__ == "__main__":
    """ This is executed when run from the command line """
    unittest.main()
