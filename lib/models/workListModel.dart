class WorkListResponseModel {
  final List<WorkListModel> visitsList;
  final int pageSize;
  final int pageIndex;
  final int totalCount;
  final int totalPages;

  WorkListResponseModel({
    required this.visitsList,
    required this.pageSize,
    required this.pageIndex,
    required this.totalCount,
    required this.totalPages,
  });

  factory WorkListResponseModel.fromJson(Map<String, dynamic> json) {
    var visitsListJson = json['VisitsList'] as List;
    List<WorkListModel> visits = visitsListJson.map((visit) => WorkListModel.fromJson(visit)).toList();

    return WorkListResponseModel(
      visitsList: visits,
      pageSize: json['PageSize'],
      pageIndex: json['PageIndex'],
      totalCount: json['TotalCount'],
      totalPages: json['TotalPages'],
    );
  }

  // دالة لتحويل VisitsResponse object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'VisitsList': visitsList.map((visit) => visit.toJson()).toList(),
      'PageSize': pageSize,
      'PageIndex': pageIndex,
      'TotalCount': totalCount,
      'TotalPages': totalPages,
    };
  }
}

class WorkListModel {
  String? visitId;
  String? semesterId;
  String? semesterName;
  String? academicYearId;
  String? academicYearName;
  String? departmentName;
  String? departmentClinicName;
  String? progressNoteId;
  bool? hasSession;
  bool? isGroupSession;
  String? clinicId;
  String? procedureCodeId;
  String? name;
  String? description;
  String? adaCode;
  double? fees;
  double? patientFees;
  bool? removed;
  int? type;
  String? toothNumber;
  String? visitName;
  String? toothRange;
  String? palmerToothRange;
  String? fdaToothRange;
  String? universalToothRange;
  String? numberingSystem;
  bool? supernumerary;
  String? procedureCode;
  String? transferDepartmentId;
  String? transferDepartmentClinicId;
  String? startTime;
  String? notes;
  String? id;
  String? checkedInOn;
  int? length;
  String? reason;
  bool? urgent;
  bool? hasLabCase;
  String? patientId;
  bool? isTicketCalled;
  String? ticket;
  String? studentId;
  Patient? patient;
  Student? student;
  Provider? provider;
  Status? status;
  Department? department;
  DepartmentClinic? departmentClinic;
  Session? session;
  String? visitTeethDetails;
  ToothNumberDto? toothNumberDto;
  String? departmentID;
  String? departmentClinicID;
  String? sessionId;
  ClinicChairsModel? operatory;
  int? totalCount;
  int? totalPages;
  String? treatmentPlanId;

  WorkListModel(
      {this.visitId,
      this.semesterId,
      this.semesterName,
      this.academicYearId,
      this.academicYearName,
      this.departmentName,
      this.departmentClinicName,
      this.progressNoteId,
      this.hasSession,
      this.isGroupSession,
      this.clinicId,
      this.procedureCodeId,
      this.name,
      this.description,
      this.adaCode,
      this.fees,
      this.patientFees,
      this.removed,
      this.type,
      this.toothNumber,
      this.visitName,
      this.toothRange,
      this.palmerToothRange,
      this.fdaToothRange,
      this.universalToothRange,
      this.numberingSystem,
      this.supernumerary,
      this.procedureCode,
      this.transferDepartmentId,
      this.transferDepartmentClinicId,
      this.startTime,
      this.notes,
      this.id,
      this.checkedInOn,
      this.length,
      this.reason,
      this.urgent,
      this.hasLabCase,
      this.patientId,
      this.isTicketCalled,
      this.ticket,
      this.studentId,
      this.patient,
      this.student,
      this.provider,
      this.status,
      this.department,
      this.departmentClinic,
      this.session,
      this.visitTeethDetails,
      this.toothNumberDto,
      this.departmentID,
      this.departmentClinicID,
      this.sessionId,
      this.operatory,
      this.totalCount,
      this.totalPages,
      this.treatmentPlanId});

  WorkListModel.fromJson(Map<String, dynamic> json) {
    visitId = json['VisitId'];
    semesterId = json['SemesterId'];
    semesterName = json['SemesterName'];
    academicYearId = json['AcademicYearId'];
    academicYearName = json['AcademicYearName'];
    departmentName = json['DepartmentName'];
    departmentClinicName = json['DepartmentClinicName'];
    progressNoteId = json['ProgressNoteId'];
    hasSession = json['HasSession'];
    isGroupSession = json['IsGroupSession'];
    clinicId = json['ClinicId'];
    procedureCodeId = json['ProcedureCodeId'];
    name = json['Name'];
    description = json['Description'];
    adaCode = json['AdaCode'];
    fees = json['Fees'];
    patientFees = json['PatientFees'];
    removed = json['Removed'];
    type = json['Type'];
    toothNumber = json['ToothNumber'];
    visitName = json['VisitName'];
    toothRange = json['ToothRange'];
    palmerToothRange = json['PalmerToothRange'];
    fdaToothRange = json['FdaToothRange'];
    universalToothRange = json['UniversalToothRange'];
    numberingSystem = json['NumberingSystem'];
    supernumerary = json['Supernumerary'];
    procedureCode = json['ProcedureCode'];
    transferDepartmentId = json['TransferDepartmentId'];
    transferDepartmentClinicId = json['TransferDepartmentClinicId'];
    startTime = json['StartTime'];
    notes = json['Notes'];
    id = json['Id'];
    checkedInOn = json['CheckedInOn'];
    length = json['Length'];
    reason = json['Reason'];
    urgent = json['Urgent'];
    hasLabCase = json['HasLabCase'];
    patientId = json['PatientId'];
    isTicketCalled = json['IsTicketCalled'];
    ticket = json['Ticket'];
    studentId = json['StudentId'];
    patient = json['Patient'] != null ? new Patient.fromJson(json['Patient']) : null;
    student = json['Student'] != null ? new Student.fromJson(json['Student']) : null;
    provider = json['Provider'] != null ? new Provider.fromJson(json['Provider']) : null;
    status = json['Status'] != null ? new Status.fromJson(json['Status']) : null;
    department = json['Department'] != null ? new Department.fromJson(json['Department']) : null;
    departmentClinic = json['DepartmentClinic'] != null ? new DepartmentClinic.fromJson(json['DepartmentClinic']) : null;
    session = json['Session'] != null ? new Session.fromJson(json['Session']) : null;
    visitTeethDetails = json['VisitTeethDetails'];
    toothNumberDto = json['ToothNumberDto'] != null ? new ToothNumberDto.fromJson(json['ToothNumberDto']) : null;
    departmentID = json['DepartmentID'];
    departmentClinicID = json['DepartmentClinicID'];
    sessionId = json['SessionId'];
    operatory = json['Operatory'] != null ? new ClinicChairsModel.fromJson(json['Operatory']) : null;
    totalCount = json['TotalCount'];
    totalPages = json['TotalPages'];
    treatmentPlanId = json['TreatmentPlanId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VisitId'] = this.visitId;
    data['SemesterId'] = this.semesterId;
    data['SemesterName'] = this.semesterName;
    data['AcademicYearId'] = this.academicYearId;
    data['AcademicYearName'] = this.academicYearName;
    data['DepartmentName'] = this.departmentName;
    data['DepartmentClinicName'] = this.departmentClinicName;
    data['ProgressNoteId'] = this.progressNoteId;
    data['HasSession'] = this.hasSession;
    data['IsGroupSession'] = this.isGroupSession;
    data['ClinicId'] = this.clinicId;
    data['ProcedureCodeId'] = this.procedureCodeId;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['AdaCode'] = this.adaCode;
    data['Fees'] = this.fees;
    data['PatientFees'] = this.patientFees;
    data['Removed'] = this.removed;
    data['Type'] = this.type;
    data['ToothNumber'] = this.toothNumber;
    data['VisitName'] = this.visitName;
    data['ToothRange'] = this.toothRange;
    data['PalmerToothRange'] = this.palmerToothRange;
    data['FdaToothRange'] = this.fdaToothRange;
    data['UniversalToothRange'] = this.universalToothRange;
    data['NumberingSystem'] = this.numberingSystem;
    data['Supernumerary'] = this.supernumerary;
    data['ProcedureCode'] = this.procedureCode;
    data['TransferDepartmentId'] = this.transferDepartmentId;
    data['TransferDepartmentClinicId'] = this.transferDepartmentClinicId;
    data['StartTime'] = this.startTime;
    data['Notes'] = this.notes;
    data['Id'] = this.id;
    data['CheckedInOn'] = this.checkedInOn;
    data['Length'] = this.length;
    data['Reason'] = this.reason;
    data['Urgent'] = this.urgent;
    data['HasLabCase'] = this.hasLabCase;
    data['PatientId'] = this.patientId;
    data['IsTicketCalled'] = this.isTicketCalled;
    data['Ticket'] = this.ticket;
    data['StudentId'] = this.studentId;
    if (this.patient != null) {
      data['Patient'] = this.patient!.toJson();
    }
    if (this.student != null) {
      data['Student'] = this.student!.toJson();
    }
    if (this.provider != null) {
      data['Provider'] = this.provider!.toJson();
    }
    if (this.status != null) {
      data['Status'] = this.status!.toJson();
    }
    if (this.department != null) {
      data['Department'] = this.department!.toJson();
    }
    if (this.departmentClinic != null) {
      data['DepartmentClinic'] = this.departmentClinic!.toJson();
    }
    if (this.session != null) {
      data['Session'] = this.session!.toJson();
    }
    data['VisitTeethDetails'] = this.visitTeethDetails;
    if (this.toothNumberDto != null) {
      data['ToothNumberDto'] = this.toothNumberDto!.toJson();
    }
    data['DepartmentID'] = this.departmentID;
    data['DepartmentClinicID'] = this.departmentClinicID;
    data['SessionId'] = this.sessionId;
    if (this.operatory != null) {
      data['Operatory'] = this.operatory!.toJson();
    }
    data['TotalCount'] = this.totalCount;
    data['TotalPages'] = this.totalPages;
    data['TreatmentPlanId'] = this.treatmentPlanId;
    return data;
  }
}

class Patient {
  String? id;
  String? id2;
  String? sSN;
  String? uSFullName;
  String? fullName;
  String? phone;
  String? address;
  String? birthDate;
  bool? hasAllergies;
  String? companyName;
  List<String>? icons;
  int? totalCount;
  List<String>? medicalAlerts;
  List<String>? allergies;
  String? patientPhone;

  Patient(
      {this.id,
      this.id2,
      this.sSN,
      this.uSFullName,
      this.fullName,
      this.phone,
      this.address,
      this.birthDate,
      this.hasAllergies,
      this.companyName,
      this.icons,
      this.totalCount,
      this.medicalAlerts,
      this.allergies,
      this.patientPhone});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    id2 = json['Id2'];
    sSN = json['SSN'];
    uSFullName = json['USFullName'];
    fullName = json['FullName'];
    phone = json['Phone'];
    address = json['Address'];
    birthDate = json['BirthDate'];
    hasAllergies = json['HasAllergies'];
    companyName = json['CompanyName'];
    icons = json['Icons'].cast<String>();
    totalCount = json['TotalCount'];
    medicalAlerts = json['MedicalAlerts'].cast<String>();
    allergies = json['Allergies'].cast<String>();
    patientPhone = json['PatientPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Id2'] = this.id2;
    data['SSN'] = this.sSN;
    data['USFullName'] = this.uSFullName;
    data['FullName'] = this.fullName;
    data['Phone'] = this.phone;
    data['Address'] = this.address;
    data['BirthDate'] = this.birthDate;
    data['HasAllergies'] = this.hasAllergies;
    data['CompanyName'] = this.companyName;
    data['Icons'] = this.icons;
    data['TotalCount'] = this.totalCount;
    data['MedicalAlerts'] = this.medicalAlerts;
    data['Allergies'] = this.allergies;
    data['PatientPhone'] = this.patientPhone;
    return data;
  }
}

class Student {
  String? code;
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;
  String? uSFullName;
  String? email;
  String? phone1;
  String? mobile;
  String? address1;
  String? sSN;
  String? studentAcademicYearId;
  int? order;

  Student(
      {this.code,
      this.firstName,
      this.middleName,
      this.lastName,
      this.fullName,
      this.uSFullName,
      this.email,
      this.phone1,
      this.mobile,
      this.address1,
      this.sSN,
      this.studentAcademicYearId,
      this.order});

  Student.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    fullName = json['FullName'];
    uSFullName = json['USFullName'];
    email = json['Email'];
    phone1 = json['Phone1'];
    mobile = json['Mobile'];
    address1 = json['Address1'];
    sSN = json['SSN'];
    studentAcademicYearId = json['StudentAcademicYearId'];
    order = json['Order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['FullName'] = this.fullName;
    data['USFullName'] = this.uSFullName;
    data['Email'] = this.email;
    data['Phone1'] = this.phone1;
    data['Mobile'] = this.mobile;
    data['Address1'] = this.address1;
    data['SSN'] = this.sSN;
    data['StudentAcademicYearId'] = this.studentAcademicYearId;
    data['Order'] = this.order;
    return data;
  }
}

class Provider {
  String? fullName;

  Provider({this.fullName});

  Provider.fromJson(Map<String, dynamic> json) {
    fullName = json['FullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FullName'] = this.fullName;
    return data;
  }
}

class Status {
  String? name;
  String? colorCode;

  Status({this.name, this.colorCode});

  Status.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    colorCode = json['ColorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['ColorCode'] = this.colorCode;
    return data;
  }
}

class Department {
  String? name;
  EnableAssign? enableAssign;

  Department({this.name, this.enableAssign});

  Department.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    enableAssign = json['EnableAssign'] != null ? new EnableAssign.fromJson(json['EnableAssign']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    if (this.enableAssign != null) {
      data['EnableAssign'] = this.enableAssign!.toJson();
    }
    return data;
  }
}

class EnableAssign {
  bool? isStudent;
  bool? enableAssign;
  bool? enableTransfer;
  String? assigningOrder;
  String? transferringOrder;

  EnableAssign({this.isStudent, this.enableAssign, this.enableTransfer, this.assigningOrder, this.transferringOrder});

  EnableAssign.fromJson(Map<String, dynamic> json) {
    isStudent = json['IsStudent'];
    enableAssign = json['EnableAssign'];
    enableTransfer = json['EnableTransfer'];
    assigningOrder = json['AssigningOrder'];
    transferringOrder = json['TransferringOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsStudent'] = this.isStudent;
    data['EnableAssign'] = this.enableAssign;
    data['EnableTransfer'] = this.enableTransfer;
    data['AssigningOrder'] = this.assigningOrder;
    data['TransferringOrder'] = this.transferringOrder;
    return data;
  }
}

class DepartmentClinic {
  String? name;

  DepartmentClinic({this.name});

  DepartmentClinic.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    return data;
  }
}

class Session {
  String? sessionId;
  String? groupId;
  String? groupName;
  String? groupDayId;
  String? groupDayName;
  String? departmentId;
  String? departmentName;
  String? courseId;
  String? courseName;
  String? studentAcademicYearId;
  String? studentAcademicYearName;
  String? departmentClinicId;
  String? departmentClinicName;

  Session(
      {this.sessionId,
      this.groupId,
      this.groupName,
      this.groupDayId,
      this.groupDayName,
      this.departmentId,
      this.departmentName,
      this.courseId,
      this.courseName,
      this.studentAcademicYearId,
      this.studentAcademicYearName,
      this.departmentClinicId,
      this.departmentClinicName});

  Session.fromJson(Map<String, dynamic> json) {
    sessionId = json['SessionId'];
    groupId = json['GroupId'];
    groupName = json['GroupName'];
    groupDayId = json['GroupDayId'];
    groupDayName = json['GroupDayName'];
    departmentId = json['DepartmentId'];
    departmentName = json['DepartmentName'];
    courseId = json['CourseId'];
    courseName = json['CourseName'];
    studentAcademicYearId = json['StudentAcademicYearId'];
    studentAcademicYearName = json['StudentAcademicYearName'];
    departmentClinicId = json['DepartmentClinicId'];
    departmentClinicName = json['DepartmentClinicName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SessionId'] = this.sessionId;
    data['GroupId'] = this.groupId;
    data['GroupName'] = this.groupName;
    data['GroupDayId'] = this.groupDayId;
    data['GroupDayName'] = this.groupDayName;
    data['DepartmentId'] = this.departmentId;
    data['DepartmentName'] = this.departmentName;
    data['CourseId'] = this.courseId;
    data['CourseName'] = this.courseName;
    data['StudentAcademicYearId'] = this.studentAcademicYearId;
    data['StudentAcademicYearName'] = this.studentAcademicYearName;
    data['DepartmentClinicId'] = this.departmentClinicId;
    data['DepartmentClinicName'] = this.departmentClinicName;
    return data;
  }
}

class ToothNumberDto {
  List<String>? universalTooth;
  List<String>? palmerToothRange;
  List<String>? fdaToothRange;

  ToothNumberDto({this.universalTooth, this.palmerToothRange, this.fdaToothRange});

  ToothNumberDto.fromJson(Map<String, dynamic> json) {
    universalTooth = json['UniversalTooth'].cast<String>();
    palmerToothRange = json['PalmerToothRange'].cast<String>();
    fdaToothRange = json['FdaToothRange'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UniversalTooth'] = this.universalTooth;
    data['PalmerToothRange'] = this.palmerToothRange;
    data['FdaToothRange'] = this.fdaToothRange;
    return data;
  }
}

class Operatory {
  String? chairId;
  String? name;

  Operatory({this.chairId, this.name});

  Operatory.fromJson(Map<String, dynamic> json) {
    chairId = json['ChairId'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ChairId'] = this.chairId;
    data['Name'] = this.name;
    return data;
  }
}

class ClinicChairsModel {
  String? chairId;
  String? chairName;
  int? operatoryStatus;

  ClinicChairsModel({this.chairId, this.chairName});

  ClinicChairsModel.fromJson(Map<String, dynamic> json) {
    chairId = json['ChairId'];
    chairName = json['Name'];
    operatoryStatus = json['OperatoryStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ChairId'] = this.chairId;
    data['Name'] = this.chairName;
    data['OperatoryStatus'] = this.operatoryStatus;
    return data;
  }
}
