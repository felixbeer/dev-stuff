#!/bin/bash

# Paths
input_folder="./"
output_folder="./output"

# GeoTIFF filename (adjust as needed)
input_filename="input.tif"

# Chunk size
chunk_size=4096

# Calculate number of chunks
num_chunks_x=$((43200 / chunk_size))
num_chunks_y=$((21600 / chunk_size))

byte_order="PC"

# Loop to split chunks
for ((i=0; i<$num_chunks_x; i++)); do
    for ((j=0; j<$num_chunks_y; j++)); do
        xoff=$((i * chunk_size))
        yoff=$((j * chunk_size))
        gdal_translate -srcwin $xoff $yoff $chunk_size $chunk_size -ot UInt16 -of ENVI --config PC_FILE_BYTE_ORDER $byte_order /data/$input_filename /data/${output_folder}/chunk_${i}_${j}.raw
    done
done

