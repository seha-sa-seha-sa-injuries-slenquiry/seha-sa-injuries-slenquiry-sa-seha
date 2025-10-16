-- قاعدة بيانات نظام الإجازات المرضية
-- Medical Leave System Database Schema

CREATE DATABASE IF NOT EXISTS seha_medical_system;
USE seha_medical_system;

-- جدول الإجازات المرضية
CREATE TABLE medical_leaves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_code VARCHAR(50) NOT NULL UNIQUE COMMENT 'رمز الإجازة (رمز الخدمة)',
    identity_number VARCHAR(20) NOT NULL COMMENT 'رقم الهوية/الإقامة',
    patient_name_ar VARCHAR(255) NOT NULL COMMENT 'اسم المريض (عربي)',
    patient_name_en VARCHAR(255) NOT NULL COMMENT 'اسم المريض (إنجليزي)',
    nationality_ar VARCHAR(100) NOT NULL COMMENT 'الجنسية (عربي)',
    nationality_en VARCHAR(100) NOT NULL COMMENT 'الجنسية (إنجليزي)',
    workplace_ar VARCHAR(255) NOT NULL COMMENT 'جهة العمل (عربي)',
    workplace_en VARCHAR(255) NOT NULL COMMENT 'جهة العمل (إنجليزي)',
    doctor_name_ar VARCHAR(255) NOT NULL COMMENT 'اسم الطبيب (عربي)',
    doctor_name_en VARCHAR(255) NOT NULL COMMENT 'اسم الطبيب (إنجليزي)',
    job_title_ar VARCHAR(255) NOT NULL COMMENT 'المسمى الوظيفي (عربي)',
    job_title_en VARCHAR(255) NOT NULL COMMENT 'المسمى الوظيفي (إنجليزي)',
    admission_date_gregorian DATE NOT NULL COMMENT 'تاريخ الدخول (ميلادي)',
    admission_date_hijri VARCHAR(20) NOT NULL COMMENT 'تاريخ الدخول (هجري)',
    discharge_date_gregorian DATE NOT NULL COMMENT 'تاريخ الخروج (ميلادي)',
    discharge_date_hijri VARCHAR(20) NOT NULL COMMENT 'تاريخ الخروج (هجري)',
    report_issue_date DATE NOT NULL COMMENT 'تاريخ إصدار التقرير',
    facility_name_ar VARCHAR(255) NOT NULL COMMENT 'اسم المنشأة (عربي)',
    facility_name_en VARCHAR(255) NOT NULL COMMENT 'اسم المنشأة (إنجليزي)',
    report_time TIME NOT NULL COMMENT 'الوقت',
    duration_days INT NOT NULL COMMENT 'المدة بالأيام',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- فهارس للبحث السريع
    INDEX idx_service_code (service_code),
    INDEX idx_identity_number (identity_number),
    INDEX idx_service_identity (service_code, identity_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- إدراج بيانات تجريبية
INSERT INTO medical_leaves (
    service_code, identity_number, patient_name_ar, patient_name_en,
    nationality_ar, nationality_en, workplace_ar, workplace_en,
    doctor_name_ar, doctor_name_en, job_title_ar, job_title_en,
    admission_date_gregorian, admission_date_hijri, discharge_date_gregorian, discharge_date_hijri,
    report_issue_date, facility_name_ar, facility_name_en, report_time, duration_days
) VALUES (
    'PSL54640252025', '7657865464', 'علي محمد علي', 'Ali Mohammed Ali',
    'السعودية', 'Saudi Arabia', 'طالب جامعي', 'University Student',
    'عبدالرحمن الدوسري', 'Abdulrahman Al-Daosari', 'طبيب عام', 'General',
    '2025-09-10', '18-03-1447', '2025-09-12', '20-03-1447',
    '2025-09-12', 'مستشفى الملك فيصل التخصصي ومركز الأبحاث', 'King Faisal Specialist Hospital and Research Centre',
    '23:15:00', 3
);
