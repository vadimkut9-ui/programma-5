Ниже — готовый HTML-файл для создания конспекта урока. Всё, что нужно, вводится с клавиатуры: тема, класс, дата, цели, ход урока, домашнее задание. Можно прикрепить файл с заданием. Данные сохраняются в браузере (localStorage), а также можно распечатать или сохранить конспект в виде HTML-файла.
```html
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Конспект урока — конструктор</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Segoe UI', Roboto, system-ui, sans-serif;
        }
        body {
            background: #f4f7fc;
            margin: 0;
            padding: 24px 16px;
            display: flex;
            justify-content: center;
        }
        .app {
            max-width: 1100px;
            width: 100%;
            background: white;
            border-radius: 32px;
            box-shadow: 0 12px 30px rgba(0, 20, 30, 0.1);
            padding: 28px 32px 32px;
        }
        h1 {
            font-size: 1.9rem;
            font-weight: 600;
            margin-top: 0;
            margin-bottom: 8px;
            color: #1e2b3c;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        h1 small {
            font-size: 0.9rem;
            font-weight: 400;
            color: #5e6f8d;
            margin-left: auto;
        }
        .subhead {
            color: #4a5b6e;
            margin-bottom: 28px;
            border-left: 4px solid #3b7fbd;
            padding-left: 16px;
            font-size: 1rem;
            background: #eef4fa;
            border-radius: 0 12px 12px 0;
            padding: 12px 18px;
        }
        .grid-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        .field {
            margin-bottom: 18px;
        }
        label {
            display: block;
            font-weight: 600;
            font-size: 0.9rem;
            color: #1e3a5f;
            margin-bottom: 6px;
            letter-spacing: 0.3px;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        label .req {
            color: #c0392b;
            font-size: 1.1rem;
        }
        input, textarea, select {
            width: 100%;
            padding: 12px 14px;
            border: 1.5px solid #cfddee;
            border-radius: 16px;
            font-size: 1rem;
            background: #fbfdff;
            transition: 0.2s;
            outline: none;
            resize: vertical;
            color: #1d2b3a;
        }
        input:focus, textarea:focus, select:focus {
            border-color: #3b7fbd;
            background: white;
            box-shadow: 0 0 0 4px rgba(59, 127, 189, 0.12);
        }
        textarea {
            min-height: 100px;
            line-height: 1.5;
        }
        .file-area {
            background: #f0f6fe;
            border-radius: 18px;
            padding: 18px 20px;
            border: 1.5px dashed #a0c0e0;
            margin: 18px 0 6px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 18px;
        }
        .file-area label {
            margin: 0;
            font-weight: 500;
            color: #155799;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            background: white;
            padding: 10px 18px;
            border-radius: 40px;
            border: 1px solid #c2d6ec;
            transition: 0.2s;
        }
        .file-area label:hover {
            background: #e1efff;
            border-color: #3b7fbd;
        }
        .file-area input[type="file"] {
            display: none;
        }
        .file-name {
            font-size: 0.95rem;
            color: #2d4e6e;
            word-break: break-word;
            flex: 1;
            min-width: 180px;
        }
        .file-name i {
            font-style: normal;
            background: #d9e9ff;
            padding: 4px 12px;
            border-radius: 30px;
            font-size: 0.85rem;
            display: inline-block;
        }
        .btn-group {
            display: flex;
            flex-wrap: wrap;
            gap: 14px;
            justify-content: flex-end;
            margin-top: 32px;
            border-top: 1px solid #dfe9f3;
            padding-top: 24px;
        }
        .btn {
            border: none;
            padding: 12px 28px;
            border-radius: 60px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            background: white;
            color: #1e3a5f;
            border: 1.5px solid #c2d6ec;
            transition: 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        .btn-primary {
            background: #1e5b9c;
            border-color: #1e5b9c;
            color: white;
        }
        .btn-primary:hover {
            background: #0f4273;
            border-color: #0f4273;
        }
        .btn:hover {
            background: #e6f0fc;
        }
        .btn-primary:hover {
            background: #0f4273;
        }
        .btn-secondary {
            background: #eef4fa;
            border-color: #b8cde4;
        }
        .preview {
            margin-top: 32px;
            background: #f8fbfe;
            border-radius: 24px;
            padding: 24px 28px;
            border: 1px solid #d7e5f2;
        }
        .preview h2 {
            font-size: 1.4rem;
            margin-top: 0;
            margin-bottom: 16px;
            color: #155799;
            font-weight: 600;
        }
        .preview-content {
            white-space: pre-wrap;
            word-break: break-word;
            line-height: 1.6;
            background: white;
            padding: 18px 22px;
            border-radius: 18px;
            border: 1px solid #e4eef8;
            min-height: 120px;
        }
        .preview-content strong {
            color: #0b2f52;
        }
        .toast {
            position: fixed;
            bottom: 24px;
            right: 24px;
            background: #1e2b3c;
            color: white;
            padding: 12px 24px;
            border-radius: 60px;
            font-weight: 500;
            box-shadow: 0 8px 24px rgba(0,0,0,0.2);
            opacity: 0;
            transition: 0.25s;
            pointer-events: none;
            z-index: 999;
        }
        .toast.show {
            opacity: 1;
        }
        .badge {
            background: #d9e9ff;
            color: #155799;
            font-size: 0.8rem;
            padding: 4px 12px;
            border-radius: 30px;
            font-weight: 500;
        }
        @media (max-width: 700px) {
            .app { padding: 20px 16px; }
            .grid-2 { grid-template-columns: 1fr; gap: 0; }
            h1 { font-size: 1.5rem; flex-wrap: wrap; }
        }
    </style>
</head>
<body>
<div class="app">
    <h1>
        📘 Конспект урока
        <small>заполните все поля</small>
    </h1>
    <div class="subhead">
        ⚡ Тема, класс, цели и ход урока вводятся с клавиатуры. Можно прикрепить файл с заданием.
    </div>

    <!-- Форма -->
    <div class="grid-2">
        <div class="field">
            <label>Тема урока <span class="req">*</span></label>
            <input type="text" id="topic" placeholder="Например: Десятичная система счисления" value="Десятичная система счисления. Ряд натуральных чисел">
        </div>
        <div class="field">
            <label>Класс <span class="req">*</span></label>
            <input type="text" id="grade" placeholder="5" value="5">
        </div>
    </div>

    <div class="grid-2">
        <div class="field">
            <label>Дата</label>
            <input type="date" id="date">
        </div>
        <div class="field">
            <label>Учитель</label>
            <input type="text" id="teacher" placeholder="ФИО" value="Светлакова Вера Андреевна">
        </div>
    </div>

    <div class="field">
        <label>Цель урока</label>
        <textarea id="goal" rows="2" placeholder="Сформировать представление о ...">Познакомить с десятичной системой счисления; научить записывать и читать натуральные числа.</textarea>
    </div>

    <div class="field">
        <label>Знать / понимать</label>
        <textarea id="know" rows="2" placeholder="Что должны знать...">Понятие натурального числа, разряды, классы; десятичная запись числа.</textarea>
    </div>

    <div class="field">
        <label>Уметь</label>
        <textarea id="can" rows="2" placeholder="Что должны уметь...">Записывать натуральные числа, определять разрядный состав, сравнивать числа.</textarea>
    </div>

    <div class="field">
        <label>Ход урока (ввод с клавиатуры)</label>
        <textarea id="lessonPlan" rows="6" placeholder="1. Организационный момент...&#10;2. Актуализация знаний...&#10;3. Изучение нового материала...&#10;4. Первичное закрепление...&#10;5. Итог урока...">1. Организационный момент (2 мин).
2. Актуализация знаний: устный счёт (5 мин).
3. Изучение нового материала: десятичная система счисления, разряды (15 мин).
4. Первичное закрепление: работа с учебником, №1.8, 1.11 (15 мин).
5. Итог урока, рефлексия (3 мин).</textarea>
    </div>

    <div class="field">
        <label>Домашнее задание</label>
        <textarea id="homework" rows="2" placeholder="п.1, №1.8, 1.11">п.1, №1.8, 1.11; индивидуальная карточка.</textarea>
    </div>

    <!-- Файл с заданием -->
    <div class="file-area">
        <label for="taskFile">
            📎 Прикрепить файл с заданием
            <input type="file" id="taskFile" accept=".pdf,.doc,.docx,.txt,.jpg,.png,.xls,.xlsx">
        </label>
        <div class="file-name" id="fileNameDisplay">
            <i>файл не выбран</i>
        </div>
    </div>
    <p style="font-size:0.85rem; color:#5e6f8d; margin-top: 4px;">Файл сохраняется в конспекте (для печати/экспорта).</p>

    <!-- Кнопки -->
    <div class="btn-group">
        <button class="btn" id="clearBtn" type="button">🗑 Очистить</button>
        <button class="btn" id="saveHtmlBtn" type="button">💾 Скачать HTML</button>
        <button class="btn btn-primary" id="updatePreviewBtn" type="button">🔄 Обновить предпросмотр</button>
    </div>

    <!-- Предпросмотр конспекта -->
    <div class="preview" id="previewBlock">
        <h2>📄 Предпросмотр конспекта</h2>
        <div class="preview-content" id="previewContent">
            <!-- сюда рендерится конспект -->
        </div>
    </div>
</div>

<div class="toast" id="toast">Готово</div>

<script>
    (function() {
        // Элементы
        const topicInput = document.getElementById('topic');
        const gradeInput = document.getElementById('grade');
        const dateInput = document.getElementById('date');
        const teacherInput = document.getElementById('teacher');
        const goalInput = document.getElementById('goal');
        const knowInput = document.getElementById('know');
        const canInput = document.getElementById('can');
        const lessonPlanInput = document.getElementById('lessonPlan');
        const homeworkInput = document.getElementById('homework');
        const taskFileInput = document.getElementById('taskFile');
        const fileNameDisplay = document.getElementById('fileNameDisplay');
        const previewContent = document.getElementById('previewContent');
        const toastEl = document.getElementById('toast');

        // Хранилище для файла (в base64, если нужно)
        let attachedFileData = null;      // { name, type, dataURL }
        let attachedFileRaw = null;       // File object (для скачивания)

        // Показать уведомление
        function showToast(msg) {
            toastEl.textContent = msg || 'Готово';
            toastEl.classList.add('show');
            setTimeout(() => toastEl.classList.remove('show'), 2200);
        }

        // Обновить отображение имени файла
        function updateFileNameDisplay() {
            if (attachedFileData) {
                fileNameDisplay.innerHTML = `<i>📎 ${attachedFileData.name}</i>`;
            } else {
                fileNameDisplay.innerHTML = `<i>файл не выбран</i>`;
            }
        }

        // Загрузка файла
        taskFileInput.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (!file) {
                attachedFileData = null;
                attachedFileRaw = null;
                updateFileNameDisplay();
                return;
            }
            attachedFileRaw = file;
            const reader = new FileReader();
            reader.onload = function(ev) {
                attachedFileData = {
                    name: file.name,
                    type: file.type,
                    dataURL: ev.target.result
                };
                updateFileNameDisplay();
                showToast('Файл прикреплён: ' + file.name);
            };
            reader.readAsDataURL(file);
        });

        // Очистка полей (кроме файла? файл тоже очистим)
        document.getElementById('clearBtn').addEventListener('click', function() {
            topicInput.value = '';
            gradeInput.value = '';
            dateInput.value = '';
            teacherInput.value = '';
            goalInput.value = '';
            knowInput.value = '';
            canInput.value = '';
            lessonPlanInput.value = '';
            homeworkInput.value = '';
            taskFileInput.value = '';
            attachedFileData = null;
            attachedFileRaw = null;
            updateFileNameDisplay();
            updatePreview();
            showToast('Поля очищены');
        });

        // Сформировать HTML-представление конспекта (для предпросмотра и скачивания)
        function buildLessonHtml() {
            const topic = topicInput.value.trim() || '(тема не указана)';
            const grade = gradeInput.value.trim() || '—';
            const date = dateInput.value ? new Date(dateInput.value).toLocaleDateString('ru-RU') : '—';
            const teacher = teacherInput.value.trim() || '—';
            const goal = goalInput.value.trim() || '—';
            const know = knowInput.value.trim() || '—';
            const can = canInput.value.trim() || '—';
            const plan = lessonPlanInput.value.trim() || '—';
            const hw = homeworkInput.value.trim() || '—';

            let fileHtml = '';
            if (attachedFileData) {
                // Безопасное экранирование имени
                const safeName = attachedFileData.name.replace(/[&<>"]/g, function(m) {
                    if (m === '&') return '&amp;';
                    if (m === '<') return '&lt;';
                    if (m === '>') return '&gt;';
                    if (m === '"') return '&quot;';
                    return m;
                });
                // В предпросмотре показываем как текст + возможность скачать (в экспорте будет ссылка)
                fileHtml = `<div style="margin-top:12px; background:#eef4fa; border-radius:12px; padding:10px 16px;">
                    📎 <strong>Файл с заданием:</strong> ${safeName}
                </div>`;
            }

            // Экранируем значения для вставки в HTML
            function escapeHtml(text) {
                if (!text) return '';
                return text.replace(/[&<>"]/g, function(m) {
                    if (m === '&') return '&amp;';
                    if (m === '<') return '&lt;';
                    if (m === '>') return '&gt;';
                    if (m === '"') return '&quot;';
                    return m;
                });
            }

            const html = `
                <div style="font-family: 'Segoe UI', Roboto, sans-serif; max-width:800px; margin:0 auto;">
                    <h1 style="color:#155799; border-bottom:3px solid #cfddee; padding-bottom:12px;">Конспект урока</h1>
                    <table style="width:100%; border-collapse:collapse; margin:16px 0; background:#f9fcff; border-radius:16px;">
                        <tr><td style="padding:10px 16px; font-weight:600; width:140px;">Тема урока:</td><td style="padding:10px 16px;">${escapeHtml(topic)}</td></tr>
                        <tr><td style="padding:10px 16px; font-weight:600;">Класс:</td><td style="padding:10px 16px;">${escapeHtml(grade)}</td></tr>
                        <tr><td style="padding:10px 16px; font-weight:600;">Дата:</td><td style="padding:10px 16px;">${escapeHtml(date)}</td></tr>
                        <tr><td style="padding:10px 16px; font-weight:600;">Учитель:</td><td style="padding:10px 16px;">${escapeHtml(teacher)}</td></tr>
                    </table>

                    <h2 style="color:#1e5b9c; margin-top:28px;">🎯 Цель урока</h2>
                    <p style="background:#f2f8ff; padding:14px 18px; border-radius:14px;">${escapeHtml(goal).replace(/\n/g, '<br>')}</p>

                    <h2 style="color:#1e5b9c;">📌 Знать / понимать</h2>
                    <p style="background:#f2f8ff; padding:14px 18px; border-radius:14px;">${escapeHtml(know).replace(/\n/g, '<br>')}</p>

                    <h2 style="color:#1e5b9c;">🛠 Уметь</h2>
                    <p style="background:#f2f8ff; padding:14px 18px; border-radius:14px;">${escapeHtml(can).replace(/\n/g, '<br>')}</p>

                    <h2 style="color:#1e5b9c;">📖 Ход урока</h2>
                    <div style="background:#f2f8ff; padding:14px 18px; border-radius:14px; white-space:pre-wrap;">${escapeHtml(plan)}</div>

                    <h2 style="color:#1e5b9c;">🏠 Домашнее задание</h2>
                    <p style="background:#f2f8ff; padding:14px 18px; border-radius:14px;">${escapeHtml(hw)}</p>

                    ${fileHtml ? `<h2 style="color:#1e5b9c;">📎 Прикреплённый файл</h2>${fileHtml}` : ''}
                    <hr style="margin:28px 0 12px; border:0; border-top:1px solid #d7e5f2;">
                    <p style="color:#7b8fa8; font-size:0.85rem;">Конспект сгенерирован в конструкторе урока</p>
                </div>
            `;
            return html;
        }

        // Обновить предпросмотр (без файла-вложения, просто имя)
        function updatePreview() {
            previewContent.innerHTML = buildLessonHtml();
        }

        // Кнопка "Обновить предпросмотр"
        document.getElementById('updatePreviewBtn').addEventListener('click', function() {
            updatePreview();
            showToast('Предпросмотр обновлён');
        });

        // Скачать HTML-файл с конспектом (включая вложение как dataURL)
        document.getElementById('saveHtmlBtn').addEventListener('click', function() {
            const topic = topicInput.value.trim() || 'конспект_урока';
            const safeTopic = topic.replace(/[^а-яА-ЯёЁa-zA-Z0-9]/g, '_').substring(0, 40);
            const fileName = `конспект_${safeTopic}.html`;

            // Собираем полноценный HTML-документ
            const lessonBody = buildLessonHtml();

            // Если есть файл — добавим ссылку для скачивания (dataURL)
            let fileBlock = '';
            if (attachedFileData) {
                // Экранируем имя для атрибута download
                const safeDownloadName = attachedFileData.name.replace(/[&<>"]/g, function(m) {
                    if (m === '&') return '&amp;';
                    if (m === '<') return '&lt;';
                    if (m === '>') return '&gt;';
                    if (m === '"') return '&quot;';
                    return m;
                });
                // Ссылка для скачивания файла (работает в браузере)
                const linkHtml = `<div style="margin:18px 0; padding:16px 20px; background:#e9f2fd; border-radius:18px;">
                    <strong>📎 Прикреплённый файл:</strong> ${safeDownloadName}<br>
                    <a href="${attachedFileData.dataURL}" download="${safeDownloadName}" style="display:inline-block; margin-top:10px; background:#1e5b9c; color:white; padding:8px 20px; border-radius:30px; text-decoration:none; font-weight:500;">⬇ Скачать файл</a>
                    <span style="color:#5e6f8d; font-size:0.85rem; margin-left:12px;">(встроен в конспект)</span>
                </div>`;
                // Заменяем или добавляем блок с файлом в lessonBody
                // Найдём место перед закрывающим div (или просто вставим после ДЗ)
                // Проще: в buildLessonHtml() уже есть fileHtml, но без ссылки. Переопределим fileHtml с ссылкой
                // Пересоберём buildLessonHtml с флагом? Проще заменить в строке.
                // Но чтобы не усложнять, вставлю fileBlock в конец перед <hr>
                const insertPos = lessonBody.lastIndexOf('<hr');
                if (insertPos !== -1) {
                    lessonBody = lessonBody.slice(0, insertPos) + linkHtml + lessonBody.slice(insertPos);
                } else {
                    lessonBody += linkHtml;
                }
            }

            const fullHtml = `<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Конспект урока — ${topic.replace(/[&<>"]/g, '')}</title>
    <style>
        body { font-family: 'Segoe UI', Roboto, sans-serif; background: #f4f7fc; margin: 0; padding: 30px 20px; display: flex; justify-content: center; }
        .lesson-card { max-width: 900px; width: 100%; background: white; border-radius: 32px; box-shadow: 0 12px 30px rgba(0,20,30,0.1); padding: 36px 40px; }
        @media print { body { background: white; } .lesson-card { box-shadow: none; padding: 10px; } }
    </style>
</head>
<body>
    <div class="lesson-card">
        ${lessonBody}
    </div>
</body>
</html>`;

            // Скачивание
            const blob = new Blob([fullHtml], { type: 'text/html;charset=utf-8' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = fileName;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url);
            showToast('Файл сохранён: ' + fileName);
        });

        // Автообновление предпросмотра при изменении полей (с задержкой)
        let debounceTimer;
        function autoUpdate() {
            clearTimeout(debounceTimer);
            debounceTimer = setTimeout(() => {
                updatePreview();
            }, 400);
        }

        // Поля, при изменении которых обновляем предпросмотр
        [topicInput, gradeInput, dateInput, teacherInput, goalInput, knowInput, canInput, lessonPlanInput, homeworkInput].forEach(el => {
            el.addEventListener('input', autoUpdate);
        });

        // При изменении файла – обновляем предпросмотр
        taskFileInput.addEventListener('change', function() {
            // небольшая задержка, чтобы attachedFileData успел обновиться
            setTimeout(updatePreview, 100);
        });

        // Инициализация: установить сегодняшнюю дату, если пусто
        if (!dateInput.value) {
            const today = new Date().toISOString().split('T')[0];
            dateInput.value = today;
        }

        // Первичное обновление предпросмотра
        updatePreview();

        // Восстановление из localStorage (по желанию)
        function loadFromLocalStorage() {
            try {
                const saved = localStorage.getItem('lessonDraft');
                if (!saved) return;
                const data = JSON.parse(saved);
                topicInput.value = data.topic || '';
                gradeInput.value = data.grade || '';
                dateInput.value = data.date || '';
                teacherInput.value = data.teacher || '';
                goalInput.value = data.goal || '';
                knowInput.value = data.know || '';
                canInput.value = data.can || '';
                lessonPlanInput.value = data.lessonPlan || '';
                homeworkInput.value = data.homework || '';
                // Файл не восстанавливаем из localStorage (слишком большой), но можно сохранить имя
                if (data.fileName) {
                    fileNameDisplay.innerHTML = `<i>📎 ${data.fileName} (не загружен)</i>`;
                }
                updatePreview();
            } catch (e) {}
        }

        // Сохраняем черновик при изменении (без файла)
        function saveDraft() {
            try {
                const data = {
                    topic: topicInput.value,
                    grade: gradeInput.value,
                    date: dateInput.value,
                    teacher: teacherInput.value,
                    goal: goalInput.value,
                    know: knowInput.value,
                    can: canInput.value,
                    lessonPlan: lessonPlanInput.value,
                    homework: homeworkInput.value,
                    fileName: attachedFileData ? attachedFileData.name : ''
                };
                localStorage.setItem('lessonDraft', JSON.stringify(data));
            } catch (e) {}
        }

        // Подписка на сохранение черновика
        [topicInput, gradeInput, dateInput, teacherInput, goalInput, knowInput, canInput, lessonPlanInput, homeworkInput].forEach(el => {
            el.addEventListener('input', saveDraft);
        });

        // Попробуем загрузить черновик
        loadFromLocalStorage();
        // Обновим предпросмотр ещё раз (если что-то загрузилось)
        updatePreview();

        // При закрытии/перезагрузке – сохраняем
        window.addEventListener('beforeunload', saveDraft);
    })();
</script>
</body>
</html>
```
