# Script to load
#run ~/.pymol/scripts/pymol-ramachandran/ramachandran.py

# Interface
set movie_loop, 0
set two_sided_lighting, 1

set label_size, 60
set label_outline_color, 1
set label_color, 0
set label_position, [0, 0, 10]

# Images
set antialias, 1

# Stick radius
set stick_radius, 0.3

# Fetch path / cache
cmd.set("fetch_path", cmd.exp_path("~\\.pymol\\cache"), quiet=0)
