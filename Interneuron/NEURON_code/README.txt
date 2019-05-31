README

CK Overstreet
12/18/2012

This folder contains NEURON code used to determine the extracellular stimulation threshold for several interneurons found in the somatosensory cortex of squirrel monkeys.

Below is a listing of the files in this folder and the steps necessary to run this code.

To obtain the threshold maps, first compile xtra.mod, then edit initxcstim to select the appropriate anat_type file and corresponding moveandstim files.  Then run initxcstim.  The moveandstim file for each neuron type repeatedly moves the extracellular electrode within the square area containing the entire neuron and approximately a 250 micron border around the cell.  Because some of the neurons are large and/or sparse, it will be more efficient to break up these simulations into multiple files and concatenate the results.



Several files in this folder are modified versions of the extracellular_stim_and_rec download available at http://www.neuron.yale.edu/ftp/ted/neuron/extracellular_stim_and_rec.zip
calcrxc.hoc
field.hoc
fixnseg.hoc
interpxyz.hoc
setpointers.hoc
stim.hoc
stimbipolar.hoc
rigc.ses
vrecc.ses
xtra.mod

Additionally, the ion channel dynamics used in this work are from McIntyre CC, Richardson AG, and Grill WM. Modeling the excitability of mammalian nerve fibers: influence of afterpotentials on the recovery cycle. Journal of Neurophysiology 87:995-1006, 2002.
This code is available on ModelDB at http://senselab.med.yale.edu/modeldb/ShowModel.asp?model=3810
AXNODE.mod

The major characteristics of cell bodies and axons were reconstructed by hand from:
E. G. Jones, Varieties and distribution of non-pyramidal cells in the somatic sensory cortex of the squirrel monkey, The Journal of Comparative Neurology, vol. 160, no. 2, pp. 205-267, Mar. 1975.
  Each anat_type file contains a different cell type.

anat_type1 - Large Multipolar
anat_type2 - Slender Multipolar
anat_type3 - Bipolar
anat_type4 - Small Round
anat_type5 - Small Granular
anat_type6 - Round with Dendritic Tuft
anat_type7 - Spiny with Recurrent Axon
anat_type8 - Modified Pyramidal




