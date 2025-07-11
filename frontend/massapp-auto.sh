#!/bin/bash

echo "=== 🚀 AUTO INTEGRASI Navigasi Project & Quiz ke Materi Detail Page ==="

cd ~/massapp/frontend || exit 1

TARGET="lib/pages/materi_detail_page.dart"

if [[ ! -f "$TARGET" ]]; then
  echo "❌ ERROR: File $TARGET tidak ditemukan!"
  exit 1
fi

# ➡️ Inject import statement (jika belum ada)
grep -q "project_page.dart" "$TARGET" || sed -i "1i import 'project_page.dart';" "$TARGET"
grep -q "quiz_page.dart" "$TARGET" || sed -i "1i import 'quiz_page.dart';" "$TARGET"

# ➡️ Inject tombol navigasi Project & Quiz (pastikan sebelum Scaffold ditutup)
if grep -q "Daftar Materi Sekarang" "$TARGET"; then
  sed -i "/Daftar Materi Sekarang/a \\
              ElevatedButton(\\
                onPressed: () {\\
                  Navigator.push(\\
                    context,\\
                    MaterialPageRoute(\\
                      builder: (context) => ProjectPage(materiId: 1),\\
                    ),\\
                  );\\
                },\\
                child: const Text('Lihat Projects'),\\
              ),\\
              ElevatedButton(\\
                onPressed: () {\\
                  Navigator.push(\\
                    context,\\
                    MaterialPageRoute(\\
                      builder: (context) => QuizPage(materiId: 1),\\
                    ),\\
                  );\\
                },\\
                child: const Text('Lihat Quiz'),\\
              )," "$TARGET"
  echo "✅ Tombol navigasi Project & Quiz otomatis disisipkan di $TARGET"
else
  echo "❌ ERROR: Gagal injeksi. Pastikan ada tombol 'Daftar Materi Sekarang' di $TARGET"
fi

echo "=== ✅ INTEGRASI SELESAI ==="
