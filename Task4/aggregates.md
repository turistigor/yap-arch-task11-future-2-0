# Описание агрегатов

В разных контекстах сущности с одинаковыми названиями могут иметь разный набор атрибутов. Такие сущности могут, но не обязаны быть связаны. Например пациент существует как участник приема и как объект лечения.

## Домен "Медицинский"

### Организационный

| Название | Тип  | Границы | Ключи | Инварианты |
|---|---|---|---|---|
| Врач | Сущность | Данные сущности | doctor_id | doctor_id is unique<br> name is not null<br> age > 0<br> address is valid<br> |
| Лаборант | Сущность | Данные сущности | lab_assistant_id | lab_assistant_id is unique<br> name is not null<br> age > 0<br> address is valid<br> |
| Пациент | Сущность | Данные сущности, Медкарта | patient_id | patient_id is unique<br> name is not null<br> age > 0<br> address is valid<br> medcard - patient: 1..1 |
| Медкарта | Сущность | Данные сущности, Приёмы | Диагноз(результат), Анализ(результат) | medcard_id | medcard_id is unique<br> diagnosis is valid |
| Диагноз | Сущность | Данные сущности | diagnosis_id | diagnosis is valid|
| Анализ | Сущность | Данные сущности, Лаборант(ФИО) | medtest_id | medtest_id is unique<br> result is valid<br> lab_assistant is not empty  |
| Приём | Агрегат | Врач (ФИО), Пациент(ФИО), Медкарта, Диагноз(результат), Анализ (результат) | appointment_id, diagnosis_id |  doctor - patient: 1..1<br> diagnosis is valid<br> medcard: one record|

### Лечение

| Название | Тип  | Границы | Ключи | Инварианты |
|---|---|---|---|---|
| Врач | Сущность | Данные сущности | doctor_id | doctor_id is unique<br> name is not null<br> skill_set is not empty<br> |
| Пациент | Сущность | Данные сущности, Медкарта | patient_id | patient_id is unique<br> name is not null<br> age > 0<br> address is valid<br> medcard - patient: 1..1 |
| Диагноз | Сущность | Данные сущности, Доктор (ФИО) | diagnosis_id | diagnosis is valid <br> details are not empty<br> doctor is not empty|
| Анализ | Сущность | Данные сущности, Лаборант (ФИО) | medtest_id | medtest_id is unique<br> details are not empty<br> result is valid<br> lab_assistant is not empty |
| Медкарта | Агрегат | Данные сущности, Диагнозы(результат), Анализы(результат) | medcard_id | medcard_id is unique<br> diagnoses are valid<br> medtests details are not empty |


## Домен "Финансовый"

### Оплата

| Название | Тип  | Границы | Ключи | Инварианты |
|---|---|---|---|---|
| Назначение | Сущность | Данные сущности | fin_service_id | purpose_id is unique<br> descr is not empty |
| Клиент | Сущность | Данные сущности | client_id | client_id is unique<br> passport_data are valid <br> address is valid |
| Платеж | Агрегат  | Клиент, Назначение, Данные сущности  | payment_id | (client_id, purpose_id, date) is unique<br> sum > 0 |

### Услуги

| Название | Тип  | Границы | Ключи | Инварианты |
|---|---|---|---|---|
| Услуга     | Сущность | Данные сущности | fin_service_id | fin_service_id is unique<br> descr is not empty |
| Клиент     | Сущность | Данные сущности, Услуги | client_id | client_id is unique<br> passport_data are valid <br> address is valid<br> fin_services are valid|

## Домен "ИИ"

### Поиск аномалий в данных

| Название | Тип  | Границы | Ключи | Инварианты |
|---|---|---|---|---|
| Запрос   | Сущность | Данные сущности | req_id | req_id is unique<br> details are not null |
| Аномалия | Агрегат  | Данные сущности, Запрос (ID) | anomaly_id | anomaly_id is unique<br> req_id is valid<br> details are not null |
| Ответ    | Агрегат  | Данные сущности, Аномалии, Запрос | resp_id, anomaly_id | resp_id is unique<br> anomalies are valid<br> req_id is valid |


### Система принятия решений

| Название | Тип  | Границы | Ключи | Инварианты |
|---|---|---|---|---|
| Запрос   | Сущность | Данные сущности | req_id | req_id is unique<br> details are not null |
| Ответ    | Сущность | Данные сущности, Запрос | resp_id | resp_id is unique<br> decision is not empty<br> req_id is valid |


### Ассистенты

| Название | Тип  | Границы | Ключи | Инварианты |
|---|---|---|---|---|
| Запрос   | Сущность | Данные сущности | req_id | req_id is unique<br> details are not null |
| Ответ    | Сущность | Данные сущности, Запрос | resp_id | resp_id is unique<br> decision is not empty<br> req_id is valid |


## Домен "Данные"

### Продуктовая аналитика

| Название | Тип  | Границы | Ключи | Инварианты |
|---|---|---|---|---|
| Отчет | Сущность | Данные сущности | report_id | report_id is unique |

### Персональная аналитика

| Название | Тип  | Границы | Ключи | Инварианты |
|---|---|---|---|---|
| Пользователь | Сущность | Данные сущности | user_id | user_id is unique<br> rights are not empty |
| Отчет | Агрегат | Данные сущности, Пользователь (ФИО, права) | report_id | report_id is unique |

## Домен "Безопасность"

### Инциденты

| Название | Тип  | Границы | Ключи | Инварианты |
|---|---|---|---|---|
| Сервис   | Сущность | Данные сущности | service_id | service_id is unique |
| Реакция   | Сущность | Данные сущности | reaction_id | reaction_id is unique |
| Инцидент | Сущность | Данные сущности, Сервис (id, ip, hostname), Реакция | incident_id | incident_id is unique<br> reaction is not null |
