import numpy as np
import cv2
arr=[]

with open ("binarydecrypted.txt") as textFile:
    for line in textFile:
        items= [item.strip() for item in line.split(',')]
        arr.append(items)

print(len(arr[0]))
array= arr[0][:-1]
print(len(array))
print(array[:5])

#32041
#Resized Dimensions :  (179, 179)

a = np.array(array)
a[a == ''] = 0
a = a.astype(np.int)

print(len(a))

img = np.empty(32041)
for i in range(32041):
    img[i]= int(str(a[i]),2)

img.resize(179,179)
print(img[:5])


print(a.shape)

cv2.imwrite('dec_img.jpg', img)
cv2.imshow("image", img)
cv2.waitKey()
