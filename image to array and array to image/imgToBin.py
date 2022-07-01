import numpy as np
import cv2
#image to binary
img=cv2.imread("enc_img.jpg",0)
f=open("enc_binary.txt","w")
print(img.shape)

scale_percent = 100 # percent of original size
width = int(img.shape[1] * scale_percent / 100)
height = int(img.shape[0] * scale_percent / 100)
dim = (width, height)

resized = cv2.resize(img, dim, interpolation = cv2.INTER_AREA)
print('Resized Dimensions : ',resized.shape)
w,h=resized.shape
print(w,h)
#count=0
for i in range(w):
    for j in range(h):
        l=""
        pix=int(resized[i][j])
        # print(img[i][j],i,j)
        for q in range(8):
            l=l+str(pix%2)
            pix=int(pix/2)
        # print(l [::-1])
        f.write(l [::-1])
        f.write(' ')
        #count=count+1
        #if(count==16):
            #f.write('\n')
            #count=0
f.close()
###########################################################################################################
# # #binary to image
#f=open("binary_ofb_decode.txt","r")
# w,h=img.shape
#count=0
#img=np.zeros((1024,1024))
# print(img[0][0])
# print(f.read(1))
#for i in range(1024):
#    for j in range(1024):
#        l=0
#        c=128
#        for q in range(8):
#            # print(f.read())
#            l=l+int(float(f.read(1)))*c
#            c=int(c/2)
#        img[i][j]=l
#        count=count+1
#        if(count==16):
#            f.read(1)
#            # print(f.read())
#           count=0
#cv2.imwrite("output_ofb.jpg",img)
