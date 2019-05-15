# Problem 4: Stereo likelihood
using Distributions
using PyPlot

# We take over the script introduced in the Julia tutorial
function rgb2gray(rgb)
    gray = 0.2989*rgb[:,:,1] + 0.5870*rgb[:,:,2] + 0.1140*rgb[:,:,3]
    return gray
end

function load_data()
    i0 = rgb2gray(Float64.(imread("i0.png")))
    i1 = rgb2gray(Float64.(imread("i1.png")))
    gt = Float64.(imread("gt.png")) * 255
    @assert maximum(gt) <= 16
    return i0::Array{Float64,2}, i1::Array{Float64,2}, gt::Array{Float64,2}
end


# Shift all pixels of i1 to the right by the value of gt
function shift_disparity(i1::Array{Float64,2}, gt::Array{Float64,2})
    id = zeros(size(i1))
    for r in 1:size(i1,1)
        for c in 1:size(i1,2)
            d = Int64(round(gt[r,c]))
            if 1 <= c+d <= size(i1,2)
                id[r,c+d] = i1[r,c]
            end
        end
    end
    @assert size(id) == size(i1)
    return id::Array{Float64,2}
end


# Crop image to the size of the non-zero elements of gt
function crop_image(i::Array{Float64,2}, gt::Array{Float64,2})
    top, left = [1 1]
    bottom, right = size(gt)
    # find top left corner
    for r in 1:size(gt,1)
        left = findfirst(gt[r,:].!=0)
        if left != nothing
            top = r
            break
        end
    end
    # find bottom right corner
    bottom = findlast(gt[:,left].!=0)
    right = findlast(gt[top,:].!=0)
    # crop image
    ic = i[top:bottom,left:right]
    return ic::Array{Float64,2}
end

function make_noise(i::Array{Float64,2}, noise_level::Float64)


    @assert size(i_noise) == size(i)
    return i_noise::Array{Float64,2}
end


# Compute the gaussian likelihood by multiplying the probabilities of a gaussian distribution
# with the given parameters for all pixels
function gaussian_lh(i0::Array{Float64,2}, i1::Array{Float64,2}, mu::Float64, sigma::Float64)


    return l::Float64
end


# Compute the negative logarithmic gaussian likelihood in log domain
function gaussian_nllh(i0::Array{Float64,2}, i1::Array{Float64,2}, mu::Float64, sigma::Float64)


    return nll::Float64
end


# Compute the negative logarithmic laplacian likelihood in log domain
function laplacian_nllh(i0::Array{Float64,2}, i1::Array{Float64,2}, mu::Float64, s::Float64)


    return nll::Float64
end


function problem4()
    # implemented me..
end
