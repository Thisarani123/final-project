import os
import cv2
import numpy as np
from tkinter import Tk, filedialog
from keras.models import load_model

# Load your trained disease classification model
model = load_model('models/disease_model.h5')

def preprocess_image(image_path):
    # Load the image using OpenCV
    img = cv2.imread(image_path)

    if img is None:
        raise FileNotFoundError(f"Error: Could not open or read image file at '{image_path}'")

    # Resize the image to the input size expected by the model
    img = cv2.resize(img, (256, 256))

    # Normalize pixel values to be between 0 and 1
    img = img / 255.0
    # Expand the dimensions of the image to match the model's expected format
    img = np.expand_dims(img, axis=0)
    return img

def display_disease(detected_disease):
    print(f"The detected disease is: {detected_disease}")

# Function to open a file dialog and select an image
def select_image():
    root = Tk()
    root.withdraw()  # Hide the main window
    file_path = filedialog.askopenfilename(title="Select Image", filetypes=(("Image files", "*.jpg;*.jpeg;*.png"), ("All files", "*.*")))
    root.destroy()
    return file_path

# Test the model with the selected image
selected_image_path = select_image()
if selected_image_path:
    detected_disease = os.path.basename(os.path.dirname(selected_image_path))  # Extract the disease from the directory name
    display_disease(detected_disease)
