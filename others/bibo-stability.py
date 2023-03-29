import numpy as np
import matplotlib.pyplot as plt

# Define a transfer function
num = [1, 2, 1]
den = [1, -0.5, 0.1]
sys = np.poly1d(num) / np.poly1d(den)

# Generate a unit step input
t = np.linspace(0, 10, 1000)
u = np.ones_like(t)

# Simulate the system's response to the input
y, _ = sys.step(T=t, X0=0, input=u)

# Plot the input and output signals
plt.plot(t, u, label='Input')
plt.plot(t, y, label='Output')
plt.xlabel('Time')
plt.ylabel('Signal')
plt.title('BIBO Stability Example')
plt.legend()
plt.show()

# Check if the system is BIBO stable
H = np.abs(np.fft.fft(sys.coeffs, n=10000))  # Frequency response
if np.max(H) < np.inf:
    print('The system is BIBO stable')
else:
    print('The system is not BIBO stable')

