import argparse
import logging
from swiptapi import create_random_swiss_plot

# Set logger
logging.basicConfig(level=logging.INFO, format='[%(asctime)s] {%(filename)s} %(levelname)s - %(message)s')

def main(output_dir: str):
	
	filename = "super_cool_map.html"
	filepath = output_dir + filename

	logging.info("Creating a map at:" + filepath)
	create_random_swiss_plot(filepath)

if __name__ == '__main__':
	parser = argparse.ArgumentParser("Make a random swiss map!")
	parser.add_argument(
		'--output_dir',
		dest ='output_dir',
		type = str,
		help ='The path to the directory in which to store the plot')

	args = parser.parse_args()
	main(args.output_dir)