import os
import cv2
import numpy as np
from keras.models import load_model
from keras.preprocessing.image import ImageDataGenerator

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

def detect_disease(image_path):
    # Preprocess the image
    processed_image = preprocess_image(image_path)
    
    # Make a prediction using the loaded model
    prediction = model.predict(processed_image)
    
    # Print the raw prediction values
    print("Raw Predictions:", prediction)
    
    # Get the class with the highest probability
    predicted_class = np.argmax(prediction, axis=1)[0]
    
    # Get the probability associated with the predicted class
    predicted_probability = prediction[0, predicted_class]
    
    # Assuming you have the classes stored in a list or obtained dynamically
    classes = ["banana_sigatoka", "healthy_banana", "banana_xanthomonas"]
    
    # Check if the predicted_class is within the valid range
    if 0 <= predicted_class < len(classes):
        predicted_disease = classes[predicted_class]
    else:
        predicted_disease = "Unknown Disease"
    
    # Print the detected disease and associated probability
    print(f"The detected disease for the image is: {predicted_disease}")
    print(f"The probability of {predicted_disease}: {predicted_probability}")

    return predicted_disease



# Test the model with example images
image_path1 = 'Dataset/banana_xanthomonas/banana_xanthomonas(1).jpg'  # Disease1
result1 = detect_disease(image_path1)

image_path2 = 'Dataset/banana_sigatoka/banana_sigatoka (1).jpeg'  # Disease2
result2 = detect_disease(image_path2)

image_path3 = 'Dataset/healthy_banana/healthy_banana (1).jpeg'  # Disease3
result3 = detect_disease(image_path3)
