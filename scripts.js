// 等待DOM加载完成
(document.addEventListener('DOMContentLoaded', function() {
    // 移动菜单切换
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const mobileMenu = document.getElementById('mobile-menu');
    
    if (mobileMenuButton && mobileMenu) {
        mobileMenuButton.addEventListener('click', function() {
            mobileMenu.classList.toggle('hidden');
        });
        
        // 点击移动菜单项后关闭菜单
        const mobileMenuLinks = mobileMenu.querySelectorAll('a');
        mobileMenuLinks.forEach(link => {
            link.addEventListener('click', function() {
                mobileMenu.classList.add('hidden');
            });
        });
    }
    
    // 导航栏滚动效果
    const navbar = document.getElementById('navbar');
    let lastScrollTop = 0;
    
    if (navbar) {
        window.addEventListener('scroll', function() {
            const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            
            if (scrollTop > 50) {
                navbar.classList.add('sticky-navbar');
                navbar.classList.remove('py-3');
                navbar.classList.add('py-2');
            } else {
                navbar.classList.remove('sticky-navbar');
                navbar.classList.remove('py-2');
                navbar.classList.add('py-3');
            }
            
            lastScrollTop = scrollTop;
        });
    }
    
    // 平滑滚动
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80, // 考虑导航栏高度
                    behavior: 'smooth'
                });
            }
        });
    });
    
    // FAQ折叠面板
    const faqToggles = document.querySelectorAll('.faq-toggle');
    
    faqToggles.forEach(toggle => {
        toggle.addEventListener('click', function() {
            const content = this.nextElementSibling;
            const icon = this.querySelector('i');
            
            // 切换当前FAQ的显示状态
            content.classList.toggle('hidden');
            icon.classList.toggle('rotate-180');
            
            // 关闭其他FAQ（可选）
            faqToggles.forEach(otherToggle => {
                if (otherToggle !== toggle) {
                    const otherContent = otherToggle.nextElementSibling;
                    const otherIcon = otherToggle.querySelector('i');
                    
                    // 如果你希望同时只打开一个FAQ，取消下面两行的注释
                    // otherContent.classList.add('hidden');
                    // otherIcon.classList.remove('rotate-180');
                }
            });
        });
    });
    
    // 回到顶部按钮
    const backToTopButton = document.getElementById('back-to-top');
    
    if (backToTopButton) {
        window.addEventListener('scroll', function() {
            if (window.pageYOffset > 300) {
                backToTopButton.classList.add('visible');
                backToTopButton.classList.remove('opacity-0');
                backToTopButton.classList.remove('invisible');
            } else {
                backToTopButton.classList.remove('visible');
                backToTopButton.classList.add('opacity-0');
                backToTopButton.classList.add('invisible');
            }
        });
        
        backToTopButton.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }
    
    // 表单提交处理
    const contactForm = document.getElementById('contact-form');
    
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // 获取表单数据
            const formData = new FormData(contactForm);
            const formValues = Object.fromEntries(formData.entries());
            
            // 构造邮件内容
            const recipient = 'hxqok@outlook.com';
            const subject = `[知识探索] ${formValues.subject || '咨询请求'}`;
            const body = `姓名: ${formValues.name}\n邮箱: ${formValues.email}\n主题: ${formValues.subject || '无主题'}\n\n留言内容:\n${formValues.message}`;
            
            // 对邮件主题和正文进行URL编码
            const encodedSubject = encodeURIComponent(subject);
            const encodedBody = encodeURIComponent(body);
            
            // 构造mailto链接
            const mailtoLink = `mailto:${recipient}?subject=${encodedSubject}&body=${encodedBody}`;
            
            // 模拟表单提交过程
            const submitButton = contactForm.querySelector('button[type="submit"]');
            const originalButtonText = submitButton.innerHTML;
            
            submitButton.disabled = true;
            submitButton.innerHTML = '<i class="fa fa-spinner fa-spin mr-2"></i> 准备发送...';
            
            // 延迟后打开邮件客户端
            setTimeout(function() {
                // 使用新窗口打开邮件客户端
                window.location.href = mailtoLink;
                
                // 显示提示信息
                alert('即将打开您的邮件客户端，请点击发送完成提交。');
                
                // 重置表单
                contactForm.reset();
                
                // 恢复按钮状态
                submitButton.disabled = false;
                submitButton.innerHTML = originalButtonText;
            }, 1500);
        });
    }
    
    // 订阅表单处理
    const newsletterForm = document.querySelector('.newsletter-section form');
    
    if (newsletterForm) {
        newsletterForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const emailInput = newsletterForm.querySelector('input[type="email"]');
            const email = emailInput.value;
            
            // 简单的邮箱验证
            if (!email || !isValidEmail(email)) {
                alert('请输入有效的邮箱地址');
                return;
            }
            
            const submitButton = newsletterForm.querySelector('button[type="submit"]');
            const originalButtonText = submitButton.innerHTML;
            
            submitButton.disabled = true;
            submitButton.innerHTML = '<i class="fa fa-spinner fa-spin mr-2"></i> 订阅中...';
            
            // 模拟网络请求延迟
            setTimeout(function() {
                alert('订阅成功！感谢您关注我们的知识通讯。');
                
                newsletterForm.reset();
                
                submitButton.disabled = false;
                submitButton.innerHTML = originalButtonText;
            }, 1500);
        });
    }
    
    // 邮箱验证函数
    function isValidEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }
    
    // 滚动动画
    function animateOnScroll() {
        const elements = document.querySelectorAll('.card, .section-title, .section-description');
        
        elements.forEach(element => {
            const elementTop = element.getBoundingClientRect().top;
            const elementVisible = 150;
            
            if (elementTop < window.innerHeight - elementVisible) {
                element.classList.add('opacity-100');
                element.classList.remove('opacity-0', 'translate-y-8');
            }
        });
    }
    
    // 初始添加动画类
    const animatedElements = document.querySelectorAll('.card, .section-title, .section-description');
    animatedElements.forEach(element => {
        element.classList.add('transition-all', 'duration-700', 'opacity-0', 'translate-y-8');
    });
    
    // 初始检查
    animateOnScroll();
    
    // 滚动时检查
    window.addEventListener('scroll', animateOnScroll);
    
    // 调整窗口大小时处理
    window.addEventListener('resize', function() {
        if (window.innerWidth >= 768 && mobileMenu && !mobileMenu.classList.contains('hidden')) {
            mobileMenu.classList.add('hidden');
        }
    });
    
    // 添加加载完成事件
    window.addEventListener('load', function() {
        document.body.classList.add('loaded');
    });
}));