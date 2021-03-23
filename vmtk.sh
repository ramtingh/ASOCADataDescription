# Converting from NRRD format to VTK image format used by VMTK 
vmtkimagewriter -ifile Norma1/Annotations/1.nrrd -ofile 1.vti

# Extract and smooth surface mesh
vmtkmarchingcubes.py -ifile 1.vti -array ImageScalars -l 0.5 --pipe vmtksurfacesmoothing -passband 0.03 -iterations 30 -ofile smooth.vtp

# Extracting vessel centerlines using VMTK
vmtksurfacereader.py -ifile smooth.vtp --pipe vmtkcenterlines -ofile ctr.vtp 

# In coronary trees with thin vessels, the mesh resolution may not be sufficiently
# high to allow centerlines to calculated, in which case a subdivision step would be added
vmtksurfacesubdivision -subdivisions 2 -method loop -ifile smooth.vtp --pipe vmtkcenterlines -ofile ctr.vtp 




