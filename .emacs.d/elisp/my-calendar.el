;;������������
;;���������ڵط��ľ�γ�ȣ�calendar���и�����������ʳ��Ԥ�⣬����ľ�γ������ϵ�ġ�
(setq calendar-latitude +39.9)
(setq calendar-longitude +116.4)

;;�ҵ����ڵر�������ӭ������ұ������ҳԷ�
(setq calendar-location-name "����")

;;�����ʲô�ģ����ˣ���˭�ܸ����ң�лл��
;;�ҵ������ļ���ܶණ�����ˣ���ӭ�����ָ����
(setq calendar-remove-frame-by-deleting t)

;;�趨һ�ܵĿ�ʼΪ��һ
(setq calendar-week-start-day 1)
;;���պ�������������
;;�Ҳ�������ͽ�Ľ��ա�ϣ�����˵Ľ��պ���˹���̵Ľ��ա�
;;�����������ߣ�������ϲ���񻰣��������ȤҲ����̽��һ�£���email���Ұ�
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)

;;�趨һЩ�Զ�������պͽ���
;;��˽��Ҫ��ɾ�����ѵ�����
;;������Щũ��������Ҫÿ����������޸�
;;��Щ��ϧ��û���й���ͳũ����˭��д����չelisp��Ūһ��
(setq general-holidays '((holiday-fixed 1 1 "Ԫ��")
(holiday-fixed 3 8 "��Ů��")
(holiday-fixed 4 1 "���˽�")
(holiday-fixed 4 11 "˭������")
(holiday-fixed 5 1 "�Ͷ���")
(holiday-fixed 10 1 "�����")
(holiday-fixed 12 25 "ʥ����")
(holiday-fixed 2 5 "Ԫ����")
(holiday-fixed 4 4 "������")
(holiday-fixed 4 21 "���")
(holiday-fixed 6 22 "�����")
(holiday-fixed 9 28 "�����")
(holiday-float 5 0 2 "ĸ�׽�")
(holiday-float 6 0 3 "���׽�")
))

;;������һЩ����
;;���������ռ��������Ҳ���Calendar�Դ���diary���ռ�
(setq mark-diary-entries-in-calendar nil)

;;��������ˣ����������Ժã�
(setq appt-issue-message nil)

;;��������ͻ����ǽ��պ�����
(setq mark-holidays-in-calendar t)

;;��calendar�Զ��򿪽��պ������б�
(setq view-calendar-holidays-initially t)

;;�����������������Ϊ�й��꣬����Ĭ�ϵ�����Ӣ��д�ģ��������޸ĵġ�
;;��������ڽ����б�Ĵ��������ܿ����������Ĵ�������д��
;;Thursday, January 22, 2004: Chinese New Year (��-��)
(setq chinese-calendar-celestial-stem
["��" "��" "��" "��" "��" "��" "��" "��" "��" "��"])
(setq chinese-calendar-terrestrial-branch
["��" "��" "��" "î" "��" "��" "��" "δ" "��" "��" "��" "��"])
