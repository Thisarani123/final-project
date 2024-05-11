from flask import Flask, request
from tensorflow.keras.models import load_model
import cv2
from PIL import Image
from flask import Flask
from keras.preprocessing import image
import numpy as np
from keras.preprocessing import image
import base64 

app = Flask(__name__)

loaded_model = load_model('model/bananaLSD.h5')

@app.route('/api', methods=['POST'])
#@app.route('/')
def index():
    try:
        input_data = request.get_json()
        if 'image' not in input_data:
            return "Error: Image data is missing", 400
        
        encoded_image = input_data['image']
        imgdata = base64.b64decode(encoded_image)
        filename = 'a.jpeg'
        
        with open(filename, 'wb') as f:
            f.write(imgdata)

        img = Image.open('a.jpeg')
        new_size = (150, 150)
        resized_img = img.resize(new_size)
       
       # Convert PIL.Image.Image to a numpy array
        img_array = image.img_to_array(resized_img)

        # Preprocess the image (optional, depending on how the model was trained)
        # Example: Rescale pixel values to the range [0, 1]
        img_array /= 255.0

        # Add an extra dimension to match the model's expected input shape (if necessary)
        # Example: Add a batch dimension if the model expects batches of images
        img_array = np.expand_dims(img_array, axis=0)

        # Perform prediction
        predictions = loaded_model.predict(img_array)

       # Assuming it's a classification problem with class probabilities as output
        # Retrieve the predicted class probabilities
        predicted_probabilities = predictions[0]  # Assuming only one image in the batch
        #print(predicted_probabilities)

        # If you want to get the predicted class (index of the class with the highest probability)
        predicted_class_index = np.argmax(predicted_probabilities)
        #print(predicted_class_index)

        class_labels = ['Healthy','Sigatoka','Xanthomonas']

        # If you have a mapping of class indices to class labels, you can retrieve the predicted label
        predicted_label = class_labels[predicted_class_index]
        #print(predicted_label)
        
        if predicted_label == 'Sigatoka':
            result = 'Banana Sigatoka'
        elif predicted_label == 'Xanthomonas':
            result = 'Banana Xanthomonas'
        elif predicted_label == 'Healthy':
            result = 'Healthy Banana'

        return result
    except Exception as e:
        return f"Error: {str(e)}", 500

if __name__ == "__main__":
    app.run(debug=True)
