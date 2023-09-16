SELECT ���, Email, ������, ��������, �����
FROM myosbb.��������_���� AS OSBB
JOIN myosbb.�������� AS P ON OSBB.ID = P.�������_��
JOIN myosbb.�������� AS KV ON P.��������_�� = KV.ID
JOIN myosbb.�������_��_������� AS BDKV ON KV.ID = BDKV.��������_��
JOIN myosbb.������� AS bud ON BDKV.�������_�� = bud.id
WHERE NOT P.���_��_��
AND OSBB.ID IN (
    SELECT OSBB.ID
    FROM myosbb.��������_���� AS OSBB
    JOIN myosbb.�������� AS P ON OSBB.ID = P.�������_��
    JOIN myosbb.�������� AS KV ON P.��������_�� = KV.ID    
    GROUP BY OSBB.ID
    HAVING COUNT(KV.ID) < 2
)
GROUP BY ���, Email, ������, ��������, �����
ORDER BY ��� DESC;