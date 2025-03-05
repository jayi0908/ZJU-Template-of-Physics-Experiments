import numpy as np
import matplotlib.pyplot as plt
from scipy import stats
from matplotlib import rcParams

# 设置中文字体以支持图例的中文显示
rcParams['font.sans-serif'] = ['SimHei', 'Microsoft YaHei', 'WenQuanYi Micro Hei']
rcParams['axes.unicode_minus'] = False

# 数据
t = [13.2, 17.6, 22.5, 27.7, 32.7, 37.7, 42.9, 47.9, 52.8, 57.9]
R = [46.2, 46.9, 47.8, 48.7, 49.6, 50.5, 51.4, 52.3, 53.2, 54.1]

# 线性回归
slope, intercept, r_value, _, _ = stats.linregress(t, R)
r_squared = r_value**2

# 生成拟合直线数据
t_fit = np.linspace(min(t), max(t), 100)
R_fit = slope * t_fit + intercept

# 绘图，汉字为图例
plt.figure(figsize=(8, 5))
plt.scatter(t, R, color='blue', label='实验数据')
plt.plot(t_fit, R_fit, 'r--', label=f'线性拟合')
plt.xlabel('温度 $t$ (°C)', fontsize=12)
plt.ylabel('电阻 $R$ (×1e-4 Ω)', fontsize=12)
plt.title('电阻-温度线性拟合', fontsize=14)

# 标注方程和 R²
equation = f'$R = {slope:.4f}t + {intercept:.4f}$\n$R^2 = {r_squared:.4f}$'
plt.text(15, 53.5, equation, fontsize=12, bbox=dict(facecolor='white', alpha=0.8))

plt.grid(linestyle='--', alpha=0.7)
plt.legend()
plt.tight_layout()
plt.savefig('电阻温度拟合.png', dpi=300)  # 保存图片为 *.png
plt.show()