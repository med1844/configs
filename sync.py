import os
import shutil
import filecmp


home = os.path.expanduser("~")


tracked_filenames = [
    (".gdbinit", home),
    (".gitconfig", home),
    (".tmux.conf", home),
    (".bash_aliases", home),
    ("config.fish", os.path.join(home, ".config/fish"))
]

for filename, src_folder in tracked_filenames:
    in_repo_filename = "./%s" % filename
    home_filename = "%s/%s" % (src_folder, filename)

    print("Checking %s -> %s... " % (home_filename, in_repo_filename), end="")

    in_repo_file_exist = os.path.isfile(in_repo_filename)
    home_file_exist = os.path.isfile(home_filename)

    if not home_file_exist and not in_repo_file_exist:
        print("skipped")
        continue
    elif not home_file_exist and in_repo_file_exist:
        os.remove(in_repo_filename)
        print("removed %s" % in_repo_filename)
    elif home_file_exist and not in_repo_file_exist:
        shutil.copyfile(home_filename, in_repo_filename)
        print("copied %s" % in_repo_filename)
    else:
        in_repo_mtime = os.path.getmtime(in_repo_filename)
        home_mtime = os.path.getmtime(home_filename)
        if in_repo_mtime != home_mtime and not filecmp.cmp(in_repo_filename, home_filename):
            src = in_repo_filename if in_repo_mtime > home_mtime else home_filename
            dst = home_filename if in_repo_mtime > home_mtime else in_repo_filename
            shutil.copyfile(src, dst)
            print("replaced %s with %s" % (dst, src))
        else:
            print("no change")

