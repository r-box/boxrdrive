# test with NULL root

    Code
      dr_box_drive_installed()
    Message <message>
      x Cannot find Box Drive installation.

---

    Code
      dr_box_drive_mounted()
    Message <message>
      x Box Drive directory not available; check that Box Drive is running.

# test with cwd root (exists)

    Code
      dr_box_drive_installed()
    Message <message>
      v Box Drive installation found.

---

    Code
      dr_box_drive_mounted()
    Message <message>
      v Box Drive directory available at '.'.

# test with /dev/null root (does not exist)

    Code
      dr_box_drive_mounted()
    Message <message>
      x Box Drive directory not available; check that Box Drive is running.

