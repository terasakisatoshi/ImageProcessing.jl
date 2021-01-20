---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.2'
      jupytext_version: 1.9.1
  kernelspec:
    display_name: Julia 1.5.3
    language: julia
    name: julia-1.5
---

```julia
using OpenCV
const cv2 = OpenCV
using PyPlot
using Images
using TestImages
```

```julia
file = TestImages.image_path(TestImages.full_imagename("m"))
img = cv2.cvtColor(cv2.imread(file), cv2.COLOR_BGR2RGB);
img = cv2.resize(img, cv2.Size{Cint}(100, 100))
img = permutedims(img, (3,2,1));
```

```julia
plt.imshow(img)
```
