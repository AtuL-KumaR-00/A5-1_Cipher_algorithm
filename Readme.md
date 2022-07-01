# A5/1 Cipher algorithm
### Implementation of A5/1 Cipher Algorithm to encrypt and decrypt Images in verilog. Used Python for Image Processing libraries 

## Indroduction to Cryptography

Cryptography is the study and practice of techniques for secure communication in the presence of third parties called adversaries. It deals with developing and analyzing protocols which prevents malicious third parties from retrieving information being shared between two entities thereby following the various aspects of information security.

Secure Communication refers to the scenario where the message or data shared between two parties can’t be accessed by an adversary. In Cryptography, an Adversary is a malicious entity, which aims to retrieve precious information or data thereby undermining the principles of information security.

Data Confidentiality, Data Integrity, Authentication and Non-repudiation are core principles of modern-day cryptography.

1. **Confidentiality** refers to certain rules and guidelines usually executed under confidentiality agreements which ensure that the information is restricted to certain people or places.
2. **Data integrity** refers to maintaining and making sure that the data stays accurate and consistent over its entire life cycle.
3. **Authentication** is the process of making sure that the piece of data being claimed by the user belongs to it.
4. **Non-repudiation** refers to ability to make sure that a person or a party associated with a contract or a communication cannot deny the authenticity of their signature over their document or the sending of a message.

## A5/1 Cipher Algorithm - Its uses and its history

A5/1 is a stream cipher used to provide over-the-air communication privacy in the GSM cellular telephone standard. It is one of several implementations of the A5 security protocol. It was initially kept secret, but became public knowledge through leaks and reverse engineering. A number of serious weaknesses in the cipher have been identified.

A5/1 is used in Europe and the United States. A5/2 was a deliberate weakening of the algorithm for certain export regions. A5/1 was developed in 1987, when GSM was not yet considered for use outside Europe, and A5/2 was developed in 1989. Though both were initially kept secret, the general design was leaked in 1994 and the algorithms were entirely reverse engineered in 1999 by Marc Briceno from a GSM telephone. In 2000, around 130 million GSM customers relied on A5/1 to protect the confidentiality of their voice communications.

Security researcher Ross Anderson reported in 1994 that "there was a terrific row between the NATO signal intelligence agencies in the mid-1980s over whether GSM encryption should be strong or not. The Germans said it should be, as they shared a long border with the Warsaw Pact; but the other countries didn't feel this way, and the algorithm as now fielded is a French design."

## Working of A5/1 Cipher Algorithm

It employs three Linear Feedback Shift Registers (LFSRs) X, Y, and Z.

The three LFSRs X, Y and Z have lengths equal to 19, 22, and 23 bits respectively. 
Register X can be represented as (x0, x1, x2, …., x18),  
register Y can be represented as (y0, y1, y2, …., y21), and 
register Z can be represented as (z0, z1, z2, …., z22).
Note: 19 + 22 + 23 = 64 bits

A 64-bit key K is used as the initial values in X, Y, and Z registers. After the registers are filled with the key, the keystream is generated through these three registers. The keystream is then XORed with the input bitstream to get the encrypted stream. 

**Functioning of Register X**:

The 14th, 17th, 18th and 19th (x13, x16, x17, x18) bits of register X are XORed and result is saved in a temporary variable (say t). Thereafter, the bits are shifted 1-position to right direction, i.e.  bit x17 is shifted to x18, bit x16 is shifted to x17 and so on till x0 is shifted to x1. After shifting, the bit saved in temporary variable t is saved in x0. It can be equated and diagrammatically represented as:

![image](https://user-images.githubusercontent.com/64649440/174137760-67e8f0fd-b0ef-45d2-9814-98ca76078f67.png)

![image](https://user-images.githubusercontent.com/64649440/174137807-e7a26181-21a9-4f4c-bf95-661a46cfabb1.png)

**Functioning of Register Y:**

The 21st and 22nd bits (y20, y21) of register Y are XORed and result is saved in a temporary variable (say t). Thereafter, the bits are shifted 1-position to right direction, i.e.  bit y20 is shifted to y21, bit y19 is shifted to y20 and so on till y0 is shifted to y1. After shifting, the bit saved in temporary variable t is saved in y0. It can be equated and represented diagrammatically as:


![image](https://user-images.githubusercontent.com/64649440/174139557-9cc3d899-daf7-47e4-910f-2fc60f013ec0.png)

![image](https://user-images.githubusercontent.com/64649440/174138012-8d1045c1-ec17-4269-97af-47b1403e984c.png)

**Functioning of Register Z:**

The 8th, 21st, 22nd and 23rd bits (z7, z20, z21, z22) of register Z are XORed and result is saved in a temporary variable (say t). Thereafter, the bits are shifted 1-position to right direction, i.e.  bit z21 is shifted to z22, bit z20 is shifted to z21 and so on till z0 is shifted to z1. After shifting, the bit saved in temporary variable t is saved in z0. It can be equated and represented diagrammatically as:


![image](https://user-images.githubusercontent.com/64649440/174139689-2c7cfc43-ce44-4eb5-9df4-6ae40221df38.png)

![image](https://user-images.githubusercontent.com/64649440/174138159-b826ae66-8e8b-4080-8f1f-1e2fa9c87aeb.png)


**Keystream generation**

In the generation of keystream, not all three X, Y and Z registers shift. The shifting of registers will be based on the function maj(x8, y10, z10) which is computed as: 

If the majority of bits x8, y10, and z10 are 0, the function returns 0; If the majority of bits x8, y10, and z10 are 1, the function returns 1.

In A5/1, for each keystream bit that we generate, the following takes place. First, we compute

![image](https://user-images.githubusercontent.com/64649440/174139971-1eb1a9ff-c420-4caa-83c0-2a4785a8a40b.png)

Then the registers X, Y, and Z shift (or not) as follows:
• If x8 = m then X shifts, i.e. if the 9th bit of register X is equal to m, the shift operation is applied to register X.
• If y10 = m then Y shifts, i.e. if the 11th bit of register Y is equal to m, the shift operation is applied to register Y.
• If z10 = m then Z shifts, i.e. if the 11th bit of register Z is equal to m, the shift operation is applied to register Z.

A few examples of registers’ shift using majority function m:

![image](https://user-images.githubusercontent.com/64649440/174139289-aa669592-013b-42ba-854c-d14450883715.png)

Finally, a single keystream bit s is generated using the least significant bits from all three registers respectively as:

![image](https://user-images.githubusercontent.com/64649440/174140071-a5f893eb-3e6d-4ccd-a1c8-d25673aaf511.png)

This generates only one keystream bit s. The whole keystream S of length n, equal to plaintext, is generated by applying the same steps n times.

The wiring diagram of A5/1 algorithm can be shown as:

![image](https://user-images.githubusercontent.com/64649440/174140161-0d57ed54-1efb-4efd-9d7c-a20dfdbdfb68.png)

**Generating Ciphertext**
The keystream generated in the A5/1 algorithm is then XORed with the plaintext to get the ciphertext. That is, 
plaintext ⊕ keystream = ciphertext

On the other hand, at the destination, keystream is generated using the same 64 bit key in A5/1 algorithm which is then XORed with the ciphertext to get the plaintext. That is,
ciphertext ⊕ keystream = plaintext

## Result:

![dec_img](https://user-images.githubusercontent.com/64649440/176882656-0a8429b4-d481-4d73-80c5-fd590af2a79a.jpg)

       |            /|\
       |             |
       |             |
       |Encoding     |
       |             |Decoding
       |             |
       |             |
      \|/            |
           
![enc_img](https://user-images.githubusercontent.com/64649440/176882940-5750e33c-98ca-420b-bed6-9c488ab4b769.jpg)




## References 
- Cryptography Introduction - GeeksforGeeks (http://www.geeksforgeeks.org/cryptography-introduction/)
- https://en.wikipedia.org/wiki/A5/1
- https://www.cryptographynotes.com/2019/02/symmetric-stream-a5by1-algorithm-linear-feedback-shift-register.html
- https://www.youtube.com/watch?v=LgZAI3DdUA4
