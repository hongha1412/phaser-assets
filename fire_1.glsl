precision mediump float;

uniform sampler2D uMainSampler; // Texture chính (ngọn lửa)
uniform vec2 uResolution;      // Kích thước màn hình
uniform float uTime;           // Thời gian để tạo hiệu ứng động

void main() {
    vec2 uv = gl_FragCoord.xy / uResolution.xy; // Tọa độ pixel
    vec4 color = texture2D(uMainSampler, uv);   // Lấy màu từ texture

    // Tạo hiệu ứng phát sáng
    float glow = color.a * 0.5; // Độ sáng dựa trên alpha của texture
    for (float i = 1.0; i < 5.0; i++) {
        glow += color.a / (i * 10.0); // Tăng vùng sáng xung quanh
    }

    // Ánh sáng động (pulsing effect)
    float pulse = 0.5 + 0.5 * sin(uTime * 2.0);

    // Kết hợp màu gốc và ánh sáng
    gl_FragColor = vec4(color.rgb * glow * pulse, color.a);
}
