README

CK Overstreet
12/18/2012

This folder contains NEURON code used to determine the extracellular
stimulation threshold for several interneurons found in the
somatosensory cortex of cats.

Below is a listing of the files in this folder and the steps necessary
to run this code.

To obtain the threshold maps, first compile xtra.mod, then edit
initxcstim to select the appropriate anat_type file and corresponding
moveandstim files.  Then run initxcstim.  The moveandstim file for
each neuron type repeatedly moves the extracellular electrode within
the square area containing the entire neuron and approximately a 250
micron border around the cell.  The moveandstim files included in this
code are not intended to be run as written - they represent the total
area that an electrode must be moved within to accurately capture the
effects of extracellular stimulation on that type of neuron.  Because
many of these neurons are large and/or sparse, it will be more
efficient to break up these simulations into multiple files and
concatenate the results.

Several files in this folder are modified versions of the
extracellular_stim_and_rec download available at
http://www.neuron.yale.edu/ftp/ted/neuron/extracellular_stim_and_rec.zip

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

Additionally, the ion channel dynamics used in this work are from
McIntyre CC, Richardson AG, and Grill WM. Modeling the excitability of
mammalian nerve fibers: influence of afterpotentials on the recovery
cycle. Journal of Neurophysiology 87:995-1006, 2002.  This code is
available on ModelDB at
http://senselab.med.yale.edu/modeldb/ShowModel.asp?model=3810

AXNODE.mod

The major characteristics of cell bodies and axons were reconstructed
by hand from:

H.D. Schwark, The distribution of intrinsic cortical axons in area 3b
of cat primary somatosensory cortex, Experimental Brain Research,
vol. 78, no. 3, pp. 501-513, Aug. 1989.  Each anat_type file contains
a different cell type.

anat_type9 - Layer II Broad
anat_type10 - Layer III Intermediate
anat_type11 - Layer III Broad External
anat_type12 - Layer IV Intermediate
anat_type13 - Layer IV Narrow
anat_type14 - Layer V Intermediate
anat_type15 - Layer VI Narrow

We generated separate "symmetrical" neuron models for cell types that
had branches with strong directional preferences but moderate
rotational symmetry about the vertical axis.  These sym models were
used for calculating the stimulation threshold in areas outside the
plane of the directional branches.

We performed some additional characterization of the response of
neurons to bipolar stimuli and monopolar stimuli of varying duration.
We used an isolated side branch of the Layer II Broad (anat_type9)
neuron model for these simulations.

initpulsecomp - moves electrode away from the axon and determines the
stimulation threshold for monopolar and bipolar stimuli
initstrdur - clarifies the relationship between pulse duration and
stimulation threshold at multiple distances from the axon.



