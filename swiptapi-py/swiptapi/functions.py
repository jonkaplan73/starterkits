import logging
from random import sample
import numpy as np

def get_random_swiss_point():
    """
    Uses basic math to pick a point in a circle that roughly approximates Switzerland
    """
    
    logging.info("Switzerland doesn't really look like a circle but thats ok!")
    
    swi_center_x = 46.801111
    swi_center_y = 8.226667
    
    radius = sample(set(np.arange(0,2.3,0.01)),1)[0]
    theta = sample(set(np.arange(0,2*np.pi,0.01)),1)[0]
    x = swi_center_x + radius*np.cos(theta)
    y = swi_center_y + radius*np.sin(theta)
    
    return {"x": x, "y": y}