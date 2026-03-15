from pyvda import AppView, get_apps_by_z_order, VirtualDesktop, get_virtual_desktops
import argparse

# Create a parser
parser = argparse.ArgumentParser(description="Takes a number as input.")

# Define expected arguments
parser.add_argument("--move", type=int, help="Desktop to move active window to")
parser.add_argument("--switch", type=int, help="Desktop to move to")
parser.add_argument("--follow", type=int, help="Desktop to move and follow active window to")
parser.add_argument("--pin", help="Pin active window")

# Define boolean arguments
parser.add_argument("--pin", action="store_true")

# Parse arguments
args = parser.parse_args()

def handle_input():

    if args.switch:
        VirtualDesktop(args.switch).go()
        return

    if args.move:
        current_window = AppView.current()
        target_desktop = VirtualDesktop(args.move)
        current_window.move(target_desktop)
        return

    if args.follow:
        current_window = AppView.current()
        target_desktop = VirtualDesktop(args.follow)
        current_window.move(target_desktop)
        VirtualDesktop(args.follow).go()
        return

    if args.pin:
        AppView.current().pin()
        return

handle_input()
