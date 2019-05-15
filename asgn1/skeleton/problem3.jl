# Problem 3: Getting to know Julia
using PyPlot
using Colors
using Images
using Statistics

# Task 1
img_rgb = Float64.(imread("a1p3.png"))
img_gray = convert(Array{Float64}, Gray.(img_rgb))

# However, this conversion does not work as expect, since the output still has 3 dimensions,
# so we take over the script introduced in the Julia tutorial
img_gray = 0.2989*img_rgb[:,:,1] + 0.5870*img_rgb[:,:,2] + 0.1140*img_rgb[:,:,3]

# Task 2
pygui(true)
figure()
imshow(img_gray, "gray")
title("grayscale")
axis("off")

# Task 3
pixel_min = minimum(img_gray)
pixel_max = maximum(img_gray)
pixel_mean = mean(img_gray)
