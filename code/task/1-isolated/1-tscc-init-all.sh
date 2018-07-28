#!/usr/bin/env bash
set -e

export SIM_IC=disk-low.dat
export TSCC_NODES=1
export GIZMO_OMP=1
for sim_config in "$REPO_DIR"/code/config/isolated-*.sh; do
    SIM_NAME="$(basename "$sim_config" .sh)"
    export SIM_NAME
    echo "Initializing $SIM_NAME"
    source "$sim_config"
    init-sim.sh
done
