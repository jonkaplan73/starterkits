import logging
import requests

class swi_pt_api_client:
    """
    An object to streamline interactions with the Swiss Public Transit API.
    """
    
    def __init__(self):
    	logging.info("Client initialized")

    def search_around_point(self, lati: long, longi: long):
    	"""
    	Searches around a specified lat long pair for buses in switzerland
    	"""
    	query = self._construct_positional_search_query(lati, longi)
    	return self._get_and_clean_request(query)

	def _construct_positional_search_query(self, x: long, y: long):
		"""
		Parses together the Swiss public transit API http request string
		"""
		base_string = 'http://transport.opendata.ch/v1/locations?'
		full_string = baseString + 'x=' + x + '&y=' + y
		return full_string

	def _get_and_clean_request(self, query: str):
		"""
		Procceses a http request and returns a json
		"""
		response = requests.get(full_string)
		return response.json()
