import numpy as np
import matplotlib.pyplot as plt

def is_bibo_stable(h):
    # Compute the absolute values of the impulse response
    h_abs = np.abs(h)
    # Compute the integral of the absolute values of the impulse response
    H_int = np.sum(h_abs)
    # Check if the integral is finite and less than infinity
    if np.isfinite(H_int) and H_int < np.inf:
        return True
    else:
        return False

# Example system
h = np.array([1, -0.5, 0.25])

# Compute the impulse response
n = np.arange(0, 10)
x = np.zeros_like(n)
x[0] = 1
h_imp = np.convolve(x, h)

# Plot the impulse response
plt.stem(h_imp)
plt.title('Impulse response')
plt.xlabel('n')
plt.ylabel('h(n)')
plt.show()

# Check if the system is BIBO stable
if is_bibo_stable(h):
    print('The system is BIBO stable')
else:
    print('The system is not BIBO stable')
