# Convert big image into smaller chunks

This script is used to convert a large (Geo)TIFF into smaller RAW chunks but can be adapted to support many other formats aswell. This can be useful for spliting a large heightmap into smaller ones and then stitching them back together with e.g. [Unity Terrain Tools](https://docs.unity3d.com/Packages/com.unity.terrain-tools@4.0/manual/index.html)

The parameters like image and chunk size need to be set inside the script. The script is supposed to run inside the ``osgeo/gdal`` docker container as it uses gdal_translate. In the directory of the script add an ``input.tif`` file and run these commands:
```sh
docker run -v ./:/data -it osgeo/gdal:latest /bin/bash
./convert_chunks.sh
```

