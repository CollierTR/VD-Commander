from pyvda import AppView, get_apps_by_z_order, VirtualDesktop, get_virtual_desktops
import argparse

# Create a parser
parser = argparse.ArgumentParser(description="Takes a number as input.")

# Define expected arguments
parser.add_argument("--move", type=int, help="Desktop to move application to")
parser.add_argument("--switch", type=int, help="Desktop to move to")

# Define boolean arguments
parser.add_argument("--pin", action="store_true")

# Parse arguments
args = parser.parse_args()


if args.switch:
    VirtualDesktop(args.switch).go()

if args.move:
    current_window = AppView.current()
    target_desktop = VirtualDesktop(args.move)
    current_window.move(target_desktop)

if args.pin:
    AppView.current().pin()