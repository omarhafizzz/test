# 1. هنجيب النسخة الرسمية من سيرفر أباتشي
FROM httpd:latest

# 2. هنمسح الصفحة الافتراضية بتاعت أباتشي
RUN rm /usr/local/apache2/htdocs/index.html

# 3. هنعمل صفحة جديدة خاصة بيك عشان لما تفتح المتصفح تتأكد إن شغلك نجح
RUN echo "<h1 style='text-align: center; margin-top: 50px;'>Hello from Jenkins! Build is Successful 🚀</h1>" > /usr/local/apache2/htdocs/index.html
