import os
import shutil
import filecmp


repo_folder_path = "."
home_folder_path = ".."

tracked_filenames = [
    ".bashrc",
    ".gdbinit",
    ".gitconfig",
    ".tmux.conf",
    ".bash_aliases",
]

for filename in tracked_filenames:
    in_repo_filename = "%s/%s" % (repo_folder_path, filename)
    home_filename = "%s/%s" % (home_folder_path, filename)

    in_repo_file_exist = os.path.isfile(in_repo_filename)
    home_file_exist = os.path.isfile(home_filename)

    if not home_file_exist and not in_repo_file_exist:
        continue
    elif not home_file_exist and in_repo_file_exist:
        os.remove(in_repo_filename)
    elif home_file_exist and not in_repo_file_exist:
        shutil.copyfile(home_filename, in_repo_filename)
        print("%s -> %s" % (home_filename, in_repo_filename))
    else:
        in_repo_mtime = os.path.getmtime(in_repo_filename)
        home_mtime = os.path.getmtime(home_filename)
        if in_repo_mtime != home_mtime and not filecmp.cmp(in_repo_filename, home_filename):
            src = in_repo_filename if in_repo_mtime > home_mtime else home_filename
            dst = home_filename if in_repo_mtime > home_mtime else in_repo_filename
            shutil.copyfile(src, dst)
            print("%s -> %s" % (src, dst))

