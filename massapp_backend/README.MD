# MassApp Backend (Node.js + Express + PostgreSQL)

## API Endpoints:
### ✅ GET /materi
Ambil semua daftar materi.

### ✅ POST /materi/submit
Tambah materi baru.
```json
{
  "title": "Judul Materi",
  "description": "Deskripsi",
  "video_url": "https://...",
  "pdf_url": "https://..."
}
