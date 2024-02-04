class Agendamento {
  int? id;
  int? idDoParceiro;
  int? idDoCliente;
  int? idDoAtendimento; // Adicionado o campo idDoAtendimento
  String? dataAgendamento;
  String? horaInicioDoAgendamento;
  String? horaFimDoAgendamento;
  Tempo? tempo;
  bool? agendamentoCancelado;
  bool? agendamentoConfirmado;
  int? comandaDoAtendimento;
  double? valorServicos;
  String? cliente;
  List<Servicos>? servicos;

  Agendamento({
    this.id,
    this.idDoParceiro,
    this.idDoCliente,
    this.idDoAtendimento, // Adicionado o campo idDoAtendimento
    this.dataAgendamento,
    this.horaInicioDoAgendamento,
    this.horaFimDoAgendamento,
    this.tempo,
    this.agendamentoCancelado,
    this.agendamentoConfirmado,
    this.comandaDoAtendimento,
    this.valorServicos,
    this.cliente,
    this.servicos,
  });

  Agendamento.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      idDoParceiro = json['idDoParceiro'];
      idDoCliente = json['idDoCliente'];
      idDoAtendimento = json['idDoAtendimento']; // Adicionado o campo idDoAtendimento
      dataAgendamento = json['dataAgendamento'];
      horaInicioDoAgendamento = json['horaInicioDoAgendamento'];
      horaFimDoAgendamento = json['horaFimDoAgendamento'];
      agendamentoCancelado = json['agendamentoCancelado'];
      agendamentoConfirmado = json['agendamentoConfirmado'];
      comandaDoAtendimento = json['comandaDoAtendimento'];
      valorServicos = json['valorServicos'];
      cliente = json['cliente'];
      if (json['servicos'] != null) {
        servicos = <Servicos>[];
        json['servicos'].forEach((v) {
          servicos!.add(new Servicos.fromJson(v));
        });
      }
    } catch (e) {
      id = json['id'];
      idDoParceiro = json['idDoParceiro'];
      idDoCliente = json['idDoCliente'];
      idDoAtendimento = json['idDoAtendimento']; // Adicionado o campo idDoAtendimento
      dataAgendamento = json['dataAgendamento'];
      horaInicioDoAgendamento = "00:00:00";
      horaFimDoAgendamento = "00:00:00";
      agendamentoCancelado = json['agendamentoCancelado'];
      agendamentoConfirmado = json['agendamentoConfirmado'];
      comandaDoAtendimento = json['comandaDoAtendimento'];
      valorServicos = double.parse(json['valorServicos'].toString());
      cliente = json['cliente'];
      if (json['servicos'] != null) {
        servicos = <Servicos>[];
        json['servicos'].forEach((v) {
          servicos!.add(new Servicos.fromJson(v));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idDoParceiro'] = this.idDoParceiro;
    data['idDoCliente'] = this.idDoCliente;
    data['idDoAtendimento'] = this.idDoAtendimento; // Adicionado o campo idDoAtendimento
    data['dataAgendamento'] = this.dataAgendamento;
    data['horaInicioDoAgendamento'] = this.horaInicioDoAgendamento; // Corrigido o campo
    data['horaFimDoAgendamento'] = this.horaFimDoAgendamento; // Corrigido o campo

    data['agendamentoCancelado'] = this.agendamentoCancelado;
    data['agendamentoConfirmado'] = this.agendamentoConfirmado;
    data['comandaDoAtendimento'] = this.comandaDoAtendimento;
    data['valorServicos'] = this.valorServicos;
    data['cliente'] = this.cliente;
    if (this.servicos != null) {
      data['servicos'] = this.servicos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class HoraInicioDoAgendamento {
  int? ticks;
  int? days;
  int? hours;
  int? milliseconds;
  int? microseconds;
  int? nanoseconds;
  int? minutes;
  int? seconds;
  double? totalDays;
  double? totalHours;
  double? totalMilliseconds;
  double? totalMicroseconds;
  double? totalNanoseconds;
  double? totalMinutes;
  double? totalSeconds;

  HoraInicioDoAgendamento(
      {this.ticks,
        this.days,
        this.hours,
        this.milliseconds,
        this.microseconds,
        this.nanoseconds,
        this.minutes,
        this.seconds,
        this.totalDays,
        this.totalHours,
        this.totalMilliseconds,
        this.totalMicroseconds,
        this.totalNanoseconds,
        this.totalMinutes,
        this.totalSeconds});

  HoraInicioDoAgendamento.fromJson(Map<String, dynamic> json) {
    ticks = json['ticks'];
    days = json['days'];
    hours = json['hours'];
    milliseconds = json['milliseconds'];
    microseconds = json['microseconds'];
    nanoseconds = json['nanoseconds'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticks'] = this.ticks;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['milliseconds'] = this.milliseconds;
    data['microseconds'] = this.microseconds;
    data['nanoseconds'] = this.nanoseconds;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    data['totalDays'] = this.totalDays;
    data['totalHours'] = this.totalHours;
    data['totalMilliseconds'] = this.totalMilliseconds;
    data['totalMicroseconds'] = this.totalMicroseconds;
    data['totalNanoseconds'] = this.totalNanoseconds;
    data['totalMinutes'] = this.totalMinutes;
    data['totalSeconds'] = this.totalSeconds;
    return data;
  }
}

class Tempo {
  int? ticks;
  int? days;
  int? hours;
  int? milliseconds;
  int? microseconds;
  int? nanoseconds;
  int? minutes;
  int? seconds;
  double? totalDays;
  int? totalHours;
  int? totalMilliseconds;
  int? totalMicroseconds;
  int? totalNanoseconds;
  int? totalMinutes;
  int? totalSeconds;

  Tempo(
      {this.ticks,
        this.days,
        this.hours,
        this.milliseconds,
        this.microseconds,
        this.nanoseconds,
        this.minutes,
        this.seconds,
        this.totalDays,
        this.totalHours,
        this.totalMilliseconds,
        this.totalMicroseconds,
        this.totalNanoseconds,
        this.totalMinutes,
        this.totalSeconds});

  Tempo.fromJson(Map<String, dynamic> json) {
    ticks = json['ticks'];
    days = json['days'];
    hours = json['hours'];
    milliseconds = json['milliseconds'];
    microseconds = json['microseconds'];
    nanoseconds = json['nanoseconds'];
    minutes = json['minutes'];
    seconds = json['seconds'];
    totalDays = json['totalDays'];
    totalHours = json['totalHours'];
    totalMilliseconds = json['totalMilliseconds'];
    totalMicroseconds = json['totalMicroseconds'];
    totalNanoseconds = json['totalNanoseconds'];
    totalMinutes = json['totalMinutes'];
    totalSeconds = json['totalSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticks'] = this.ticks;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['milliseconds'] = this.milliseconds;
    data['microseconds'] = this.microseconds;
    data['nanoseconds'] = this.nanoseconds;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    data['totalDays'] = this.totalDays;
    data['totalHours'] = this.totalHours;
    data['totalMilliseconds'] = this.totalMilliseconds;
    data['totalMicroseconds'] = this.totalMicroseconds;
    data['totalNanoseconds'] = this.totalNanoseconds;
    data['totalMinutes'] = this.totalMinutes;
    data['totalSeconds'] = this.totalSeconds;
    return data;
  }
}

class Servicos {
  int? id;
  int? idDoServico;
  String? descricaoServico;
  double? valor;
  double? comissao;
  int? tempo;

  Servicos(
      {this.id,
        this.idDoServico,
        this.descricaoServico,
        this.valor,
        this.comissao,
        this.tempo});

  Servicos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idDoServico = json['idDoServico'];
    descricaoServico = json['descricaoServico'];
    valor = double.parse(json['valor'].toString());
    comissao = double.parse(json['comissao'].toString());
    tempo = json['tempo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idDoServico'] = this.idDoServico;
    data['descricaoServico'] = this.descricaoServico;
    data['valor'] = this.valor;
    data['comissao'] = this.comissao;
    data['tempo'] = this.tempo;
    return data;
  }
  // Adding a toMap method for consistency
  Map<String, dynamic> toMap() {
    return toJson();
  }

}