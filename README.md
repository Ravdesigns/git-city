# git-city

A 3D skyline built from a git repository's commit history. Every building is one
file changed in one commit — its height scales with lines added + removed, its
colour encodes the file type (or author, or a flat mono palette). The timeline
runs left → right, oldest commits to newest.

Built with [Three.js](https://threejs.org) r149. No build step, no framework —
one HTML file plus two vendored modules served statically.

**Live → [git-city-kappa.vercel.app](https://git-city-kappa.vercel.app)**

## Controls

| input            | action                                       |
| ---------------- | -------------------------------------------- |
| drag             | rotate                                       |
| scroll           | zoom                                         |
| `R`              | reset camera                                 |
| `1` / `2` / `3`  | palette — by extension / by author / mono    |

## Run locally

ES modules won't load over `file://`, so serve it over HTTP:

```bash
python3 -m http.server 8123
# open http://localhost:8123
```

## Regenerate the city from your own repo

The committed `data.js` is baked from one repo. Rebuild it from any local git repo:

```bash
./build.sh /path/to/your/repo
```

`build.sh` → `build.py` runs `git log --all --numstat`, groups changed files per
commit, and writes `window.COMMIT_DATA` into `data.js`. Reload to see your skyline.

## How it works

- **`build.py`** walks `git log --all --pretty=… --numstat`, collecting the files
  touched in each commit with their insert/delete counts, and emits `data.js`.
- **`index.html`** reads `window.COMMIT_DATA`, places commits along X
  (chronological) and each commit's files along Z, then extrudes one box per file.
  Tiny additive `THREE.Points` scatter "window lights" across the taller towers.

---

One of a series of small offline-first artifacts by
[Ravindra Sisodia](https://github.com/Ravdesigns).
