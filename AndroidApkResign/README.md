Android APK ��ǩ������
===

### Ӧ�ó���
��ʹ��robotium�����Զ�������ʱ����Ҫ����Ӧ�������apkǩ��һ�£�������������ִ�С���ˣ��Դ���Ӧ����ǩ��������Ҫ��������⡣
�������˸������Ϻ�ʵ����һ���򵥵��������ļ�������ɶ�apk��ǩ����
ʹ�ò��裺
1. ʹ��7z��apk�ļ�
2. ɾ��META-INF�ļ���
3. �ر�7z,�õ�û��ǩ����apk�ļ�:nosign.apk
4. ����run.bat������apk�ľ���·������ʼ��ǩ����

### ʵ��ԭ��
1. ǩ���ļ�ʹ�õ��ǵ�ǰ���е����ϵ� debug.keystore, ��Ȼ��Ҳ����ʹ���Լ���key, �޸��������ļ��Ϳ����ˡ�
2. ǩ������

```
jarsigner -verbose -keystore debug.keystore -signedjar phonebook_signed.apk phonebook.apk mine.keystore
```

jarsigner��java��ǩ������
- verbose������ʾ����ʾ��ǩ����ϸ��Ϣ
- keystore��ʾʹ�õ�ǰĿ¼�е�debug.keystoreǩ��֤���ļ���
- signedjar phonebook_signed.apk��ʾǩ�������ɵ�apk���ƣ�phonebook.apk��ʾδǩ����apk android������� �� mine.keystore��ʾ����.

����sdk����ʹ�õ�keystore��
keystore���֣���debug.keysotre��
keystore���룺��android��
key��������androiddebugkey��
key���룺��android��
