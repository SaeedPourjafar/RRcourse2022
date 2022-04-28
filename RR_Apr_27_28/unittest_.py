# A function to convert Fahrenheit to either Celsius or Kelvins
def TempConverter(fahr: float,target: str) -> float:
	# Check for the valid temperature scale and throw an error if any other scale provided
    if target.lower() not in ['celsius','kelvins']:
        raise ValueError("Oops! That was no valid unit of temperature.\n Please only use either Celsius or Kelvins")
    # This try/except will catch the error of wrong degree if it's not a number
    try:
        fahr = float(fahr)
        # The minimum of theoretical temperature in Fahrenheit scale
        if fahr >= (-459.67): 
            c = ((fahr - 32.0) * (5.0/9.0))
            if target.lower() == 'celsius':
                return round(c,2)
            elif target.lower() == 'kelvins':
                return round(273.15 + c,2)
        # Raise and exception if the Fahrenheit value is not within the accepted range
        else:
            raise Exception('Oops! That was not a valid Fahrenheit value')        
    except ValueError:
            print("Oops! That was not a float")        


import unittest

class TestTemp(unittest.TestCase):

    def test_celsius(self):
        self.assertEqual(TempConverter(50, 'Celsius'), 10)
        self.assertEqual(TempConverter(70, 'Celsius'), 21.11)
        self.assertEqual(TempConverter(90, 'Celsius'), 32.22)

    def test_wrong_inputs(self):
        with self.assertRaises(ValueError):
            TempConverter(50, 'Réaumur')

    def test_kelvin(self):
     	self.assertEqual(TempConverter(0,'Kelvins'),255.37)
     	self.assertEqual(TempConverter(1000,'Kelvins'),810.93)

    def test_out_of_range(self):
    	with self.assertRaises(Exception):
    		TempConverter(-500,'Kelvins')

if __name__ == '__main__':
    unittest.main()