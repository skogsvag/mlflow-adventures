FROM python:3.10.12-slim-buster

WORKDIR /app 

COPY requirements.txt ./
COPY ./models/ ./models

RUN pip install --no-cache-dir -r requirements.txt

#CMD ["mlflow","models","serve","-m","./models","-h","0.0.0.0","-p","5002","--no-conda"]
COPY ./app_wrapper.py ./scaler-knn.pkl ./
COPY ./scaler-rfc.pkl ./

CMD ["python","app_wrapper.py"]    

EXPOSE 5002