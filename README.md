# DUCK MedVision v0.1 — biomedical imaging research workbench

## Open the app online

**GitHub Pages:** [Launch DUCK MedVision](https://lazykode.github.io/duck-medvision/)  
**Repository:** https://github.com/lazyKode/duck-medvision

The public website hosts only the static viewer code, not your scans. Images/videos you select are processed locally in your browser; do not commit or publish patient scans or identifying health records to this public repository. Live ultrasound sensing and diagnosis are **not** implemented.

This is a **functional, offline-first prototype viewer**, not an ultrasound scanner and not medical software. It does not make an iPhone camera see through skin. It **does not diagnose tendon injuries**.

## What works now
- Import ultrasound **image or video** already acquired from legitimate sources, using local file-picker (no upload/server).
- View and play/pause a recorded ultrasound video, scrub timeline.
- Zoom a scan and **manually** label possible tendon, vessel, muscle or bone-surface locations.
- Manually mark two points to show **image pixels only**. No millimeter measurements or calibration is claimed.
- Write notes and export an annotated PNG or text notes locally.
- Synthetic signal demo for testing UI, clearly marked as NOT MEDICAL DATA.

## Get started
- On a Windows/Mac/Linux desktop: open `index.html` in a modern browser.
- On iPhone: host the `index.html` file with HTTPS such as **GitHub Pages** (Settings > Pages > Deploy from branch > main / root), then open the site on Safari. You may use Share > Add to Home Screen. No public file uploads are involved.
- For a local PC server: run `START_WINDOWS.cmd`. This only serves the static page at http://127.0.0.1:8877; it does not process or upload data.

## Hardware integration design — not implemented yet

**First candidate**: licensed high-frequency linear ultrasound, such as Clarius L15 HD3, with vendor-approved developer rights and documented API.

The publicly documented Cast API supports receiving grayscale and color Doppler frames in real time and has an iOS Swift example, but it **requires the Clarius App to be connected**, the probe, and appropriate licensing. Due to side-by-side iOS platform caveats, a Windows bridge / iPad / dedicated OEM SDK may be needed. Do not buy equipment until the manufacturer confirms the intended integration and license.

Conceptual pipeline:
1. FDA-authorized ultrasound scanner used by a qualified clinician.
2. Stream acquired frames to approved receiver via vendor API.
3. Frame time sync, probe pose, calibration, and anonymization.
4. Research segmentation model trained/tested on appropriate annotated MSK ultrasound datasets.
5. Display genuine anatomy, with confidence/uncertainty and provenance.
6. Optional calibrated image registration / research-only 3D reconstruction.

Do **not** build an untested ultrasound transmitter and apply it to the body. Diagnostic ultrasound energy still requires output and exposure safety oversight. All patient data needs permissions and privacy controls. Clinician interpretation is required for diagnosis.

## Proof-of-concept milestones
- M0 (this version): upload/play/annotate educational ultrasound media and export — DONE, code-level, browser testing remains user-dependent.
- M1: validate representative MSK datasets and build manual reference annotations and training/test split.
- M2: develop and evaluate an anatomical-labeling assistant (no injury diagnosis).
- M3: permissioned real-time imaging using compatible scanner + vendor SDK, with hardware-in-the-loop validation.
- M4: camera-probe calibration and motion-compensated spatial overlay with uncertainty display.
- M5: pursue clinician collaboration, bench studies, IRB review when needed, and FDA regulatory strategy before diagnostic claims.

## Key current research & technical references (accessed Nov 12, 2026)
- FDA — Ultrasound imaging overview: https://www.fda.gov/radiation-emitting-products/medical-imaging/ultrasound-imaging
- AIUM — ALARA (Aug 2026): https://www.aium.org/resources/official-statements/view/as-low-as-reasonably-achievable-%28alara%29-principle
- Clarius developer portal: https://github.com/clariusdev
- Clarius Cast iOS Swift reference: https://github.com/clariusdev/cast
- Clarius L15 HD3 (product data/pricing): https://store.clarius.com/products/l15-hd3-handheld-ultrasound-scanner
- 3D Slicer: https://slicer.org/
- Plus Toolkit: https://pluslib.readthedocs.io/en/latest/
- Public ultrasound datasets index: https://github.com/TIanCat/open-medical-ultrasound-datasets
- 2026 miniature photoacoustic vessel monitoring: https://www.nature.com/articles/s41467-025-68190-6
- 2026 hybrid 3D ultrasound+photoacoustics: https://www.nature.com/articles/s41551-025-01603-5
- FDA AI medical devices: https://www.fda.gov/medical-devices/digital-health-center-excellence/artificial-intelligence-enabled-medical-devices

## Research gap / originality
Real-time tendon ultrasound and vascular visualization already exist. A new contribution would need measurable evidence: e.g., a low-cost, clinically validated, easy-to-use, calibrated multimodal imaging/AR system with interpretable uncertainty. The initial app is **not** a medical or scientific breakthrough.

## Privacy & license
- All code in this zip is newly authored for this prototype. No third-party binary or clinical imagery bundled.
- Data remains in browser memory unless explicitly exported. Imported files are not transmitted to any server.
- No auto-saving. Reloading the page clears the session.