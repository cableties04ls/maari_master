import csv
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Dense
from sklearn.metrics import roc_curve, auc

raw = np.genfromtxt("cnn_data/cnn_train.csv", delimiter=',', skip_header=1)
label = raw[:, 0].reshape(-1, 1,1,1)
data = raw[:, 1:].reshape((-1, 11, 10))

#訓練データとテストデータを8:2に分ける
data_train = data[:2948]
label_train = label[:2948]
data_test = data[2948:]
label_test = label[2948:]

#CNNモデルの構築
model = Sequential()
model.add(Conv2D(32, (3, 3), activation='relu', input_shape=(11, 10, 1)))
model.add(MaxPooling2D((2, 2)))
model.add(Conv2D(64, (3, 3), activation='relu'))
model.add(MaxPooling2D((2, 2)))
model.add(Dense(1, activation='sigmoid'))

model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
model.summary()
model.fit(data_train, label_train, epochs=10, batch_size=32)

print('-------')
loss, accuracy = model.evaluate(data_test, label_test)
print("テストデータの損失:", loss)
print("テストデータの精度:", accuracy)

#混同行列
y_pred = model.predict(data_test)

label_test = tf.constant(label_test).numpy()
y_pred = tf.constant(y_pred).numpy()

label_test = label_test.flatten()
y_pred = y_pred.flatten()

label_test = label_test.astype(int)
y_pred = np.round(y_pred).astype(int)

cm = tf.math.confusion_matrix(label_test, y_pred)
print(cm)

# Compute RoC curve
fpr, tpr, thresholds = roc_curve(label_test, y_pred)
roc_auc = auc(fpr, tpr)

# Plot RoC curve
plt.figure()
plt.plot(fpr, tpr, color='darkorange', lw=2, label='RoC curve (area = %0.2f)' % roc_auc)
plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('Receiver Operating Characteristic')
plt.legend(loc="lower right")
plt.show()
