<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Embedded Infographic Generator</title>
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        .embedded-container {
            max-width: 100%;
            margin: 0 auto;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        /* Input Section */
        .input-section {
            margin-bottom: 2rem;
        }

        textarea {
            width: 100%;
            height: 150px;
            padding: 15px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            resize: vertical;
            font-size: 16px;
            margin-bottom: 1rem;
        }

        /* Style Selector */
        .style-picker {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .style-option {
            padding: 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }

        .style-option:hover {
            border-color: #4299e1;
        }

        .style-option.active {
            border-color: #4299e1;
            background: #ebf8ff;
        }

        /* Preview Section */
        .preview-section {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-top: 2rem;
        }

        .infographic-preview {
            max-width: 100%;
            height: auto;
            display: none;
        }

        /* Buttons */
        .btn {
            background: #4299e1;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: opacity 0.3s ease;
            width: 100%;
        }

        .btn:hover {
            opacity: 0.9;
        }

        /* Responsive Design */
        @media (min-width: 768px) {
            .embedded-container {
                padding: 30px;
            }
            
            textarea {
                height: 200px;
            }
            
            .btn {
                width: auto;
            }
        }
    </style>
</head>
<body>
    <div class="embedded-container">
        <div class="input-section">
            <h2 style="margin-bottom: 1rem; color: #2d3748;">Create Your Infographic</h2>
            <textarea 
                placeholder="Paste your text here..."
                id="input-text"></textarea>
            
            <div class="style-picker">
                <div class="style-option active" onclick="selectStyle(this, 'modern')">
                    🎨 Modern
                </div>
                <div class="style-option" onclick="selectStyle(this, 'professional')">
                    💼 Professional
                </div>
                <div class="style-option" onclick="selectStyle(this, 'fun')">
                    🎉 Fun
                </div>
            </div>
            
            <button class="btn" onclick="generateInfographic()">
                Generate Infographic
            </button>
        </div>

        <div class="preview-section">
            <img src="placeholder-infographic.jpg" 
                 alt="Infographic Preview" 
                 class="infographic-preview"
                 id="preview">
            <p style="text-align: center; color: #718096;" id="status">
                Your infographic will appear here
            </p>
        </div>
    </div>

    <script>
        let selectedStyle = 'modern';

        function selectStyle(element, style) {
            // Remove active class from all options
            document.querySelectorAll('.style-option').forEach(option => {
                option.classList.remove('active');
            });
            
            // Add active class to clicked option
            element.classList.add('active');
            selectedStyle = style;
        }

        function generateInfographic() {
            const inputText = document.getElementById('input-text').value;
            const preview = document.getElementById('preview');
            const status = document.getElementById('status');

            if (!inputText) {
                alert('Please enter some text!');
                return;
            }

            // Simulated processing
            status.textContent = 'Generating infographic...';
            preview.style.display = 'none';

            // Simulated API call
            setTimeout(() => {
                preview.style.display = 'block';
                status.textContent = 'Your infographic is ready!';
                // In real implementation, replace with actual infographic URL
                preview.src = `https://placehold.co/600x400?text=${selectedStyle}+Style+Infographic`;
            }, 1500);
        }
    </script>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Infographic Generator</title>
    <style>
        :root {
            --bg-color: #ffffff;
            --text-color: #2d3748;
            --primary: #4299e1;
            --border-color: #e2e8f0;
        }

        [data-theme="dark"] {
            --bg-color: #1a202c;
            --text-color: #e2e8f0;
            --primary: #63b3ed;
            --border-color: #4a5568;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
            transition: background 0.3s ease;
        }

        body {
            background: var(--bg-color);
            color: var(--text-color);
        }

        .embedded-container {
            max-width: 100%;
            margin: 0 auto;
            padding: 20px;
            background: var(--bg-color);
            border-radius: 12px;
        }

        /* Dark Mode Toggle */
        .theme-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            cursor: pointer;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: var(--text-color);
        }

        /* File Upload */
        .file-upload {
            margin: 1rem 0;
            position: relative;
        }

        .file-upload input {
            opacity: 0;
            position: absolute;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .file-upload label {
            display: block;
            padding: 12px;
            border: 2px dashed var(--border-color);
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
        }

        /* Real-time Preview Enhancements */
        .preview-section {
            position: relative;
        }

        .live-preview {
            border: 2px solid var(--border-color);
            padding: 1rem;
            min-height: 200px;
            margin: 1rem 0;
            white-space: pre-wrap;
        }

        /* Social Sharing */
        .social-sharing {
            display: none;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .social-btn {
            padding: 8px 16px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            color: white;
        }

        .twitter { background: #1DA1F2; }
        .facebook { background: #1877F2; }
        .linkedin { background: #0A66C2; }

        /* Previous styles here... */
    </style>
</head>
<body>
    <button class="theme-toggle" onclick="toggleTheme()">🌓</button>
    
    <div class="embedded-container">
        <div class="input-section">
            <h2>Create Your Infographic</h2>
            
            <div class="file-upload">
                <input type="file" id="fileInput" accept=".txt,.md">
                <label for="fileInput">📁 Upload Text File</label>
            </div>

            <textarea 
                id="input-text" 
                placeholder="Or paste text here..."
                oninput="updateLivePreview()"></textarea>

            <div class="live-preview" id="livePreview"></div>

            <!-- Style Picker and Generate Button -->
        </div>

        <div class="preview-section">
            <!-- Infographic Preview -->
            <div class="social-sharing" id="socialSharing">
                <a href="#" class="social-btn twitter" target="_blank">🐦 Twitter</a>
                <a href="#" class="social-btn facebook" target="_blank">📘 Facebook</a>
                <a href="#" class="social-btn linkedin" target="_blank">💼 LinkedIn</a>
            </div>
        </div>
    </div>

    <script>
        // Dark Mode Toggle
        function toggleTheme() {
            document.body.setAttribute('data-theme',
                document.body.getAttribute('data-theme') === 'dark' ? 'light' : 'dark'
            );
            localStorage.setItem('theme', document.body.getAttribute('data-theme'));
        }

        // File Upload Handler
        document.getElementById('fileInput').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file && file.type === "text/plain") {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('input-text').value = e.target.result;
                    updateLivePreview();
                }
                reader.readAsText(file);
            }
        });

        // Real-time Preview
        function updateLivePreview() {
            const text = document.getElementById('input-text').value;
            document.getElementById('livePreview').textContent = text.substring(0, 500);
        }

        // Enhanced Generate Function
        function generateInfographic() {
            // ... previous generate code ...

            // Show social sharing
            document.getElementById('socialSharing').style.display = 'flex';
            const shareUrl = `https://example.com/infographic/${Date.now()}`;
            document.querySelectorAll('.social-btn').forEach(btn => {
                btn.href = `https://${btn.classList[1]}.com/share?url=${encodeURIComponent(shareUrl)}`;
            });
        }

        // Initialize theme
        if (localStorage.getItem('theme')) {
            document.body.setAttribute('data-theme', localStorage.getItem('theme'));
        }
    </script>
</body>
</html>
