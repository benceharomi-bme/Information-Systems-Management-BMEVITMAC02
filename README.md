# Information-Systems-Management-BMEVITMAC02

## Task description
A git commit id is given. On the branch containing the commit search from the specified commit backwards in
time for the commit where the file named detail.cpp was deleted.

## Script
### Example
In the development branch a `detail.cpp` file was already created then deleted.
Run the script with the following command:
```
bash src/script.sh
```
Search for the `detail.cpp` file starting from the `0461b7ec903c28c7829c35d32e0e140b6a696e8f` commit:
```
Please enter the name of the searched file: detail.cpp
Please enter the hash of the commit where the search should start: 0461b7ec903c28c7829c35d32e0e140b6a696e8f
```
It responds with the commit where the file was deleted:
```
The 0461b7ec903c28c7829c35d32e0e140b6a696e8f commit is present on the following branch(es): master

The file detail.cpp was deleted in the following commit:
        Hash: a95d5552c7d5ad9e908bea186bf98b13b7f5a1de
        Message: detail removed
        Date: 2022-05-21 18:26:44 +0200
        Committer: Bence Haromi
```

### Error handling
If the start commit is not found the script responds with the following error:
```
No branch found which contains a commit with the hash of 2e6b9f22b5aa88f7a9afe5dc84dab8df08acf335
```
If there is no commit with th file deletion, the following error is printed:
```
No commit found where the file det.cpp was deleted
```
