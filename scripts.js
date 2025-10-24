// 网站核心功能脚本

// 返回顶部按钮功能
function initBackToTop() {
    const backToTopButton = document.getElementById('back-to-top');
    
    if (backToTopButton) {
        window.addEventListener('scroll', () => {
            if (window.pageYOffset > 300) {
                backToTopButton.classList.remove('opacity-0', 'invisible');
                backToTopButton.classList.add('opacity-100', 'visible');
            } else {
                backToTopButton.classList.remove('opacity-100', 'visible');
                backToTopButton.classList.add('opacity-0', 'invisible');
            }
        });
        
        backToTopButton.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }
}

// 切换内容显示/隐藏
function toggleContent(elementId, linkElement) {
    const element = document.getElementById(elementId);
    if (element) {
        if (element.classList.contains('hidden')) {
            element.classList.remove('hidden');
            if (linkElement) linkElement.textContent = '收起';
        } else {
            element.classList.add('hidden');
            if (linkElement) linkElement.textContent = '阅读更多';
        }
    }
}

// 切换子内容显示/隐藏（带图标旋转）
function toggleSubContent(elementId) {
    const element = document.getElementById(elementId);
    if (element && element.previousElementSibling) {
        const icon = element.previousElementSibling.querySelector('i');
        if (element.classList.contains('hidden')) {
            element.classList.remove('hidden');
            if (icon) icon.classList.add('rotate-180');
        } else {
            element.classList.add('hidden');
            if (icon) icon.classList.remove('rotate-180');
        }
    }
}

// 导航栏滚动效果
function initNavbarScroll() {
    const navbar = document.querySelector('nav');
    if (navbar) {
        let lastScrollTop = 0;
        window.addEventListener('scroll', () => {
            const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            
            if (scrollTop > 50) {
                navbar.classList.add('bg-primary/95', 'shadow-md');
                navbar.classList.remove('bg-transparent');
            } else {
                navbar.classList.remove('bg-primary/95', 'shadow-md');
                navbar.classList.add('bg-transparent');
            }
            
            lastScrollTop = scrollTop;
        });
    }
}

// 初始化所有功能
function initializeAllFeatures() {
    // 页面加载完成后初始化
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            initBackToTop();
            initNavbarScroll();
        });
    } else {
        initBackToTop();
        initNavbarScroll();
    }
}

// 执行初始化
initializeAllFeatures();