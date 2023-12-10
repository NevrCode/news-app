import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 241, 244, 248),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pop();
          },
          child: const Icon(
            Icons.chevron_left_rounded,
            color: Color.fromARGB(255, 20, 24, 27),
            size: 32,
          ),
        ),
        title: const Text(
          'Judulnya masuk sini bang...',
          style: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/seed/467/600',
                                width: 751,
                                height: 255,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                              child: Text(
                                'Subjudul bang...',
                                style: TextStyle(
                                  fontFamily: 'Readex',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 8, 0, 0),
                              child: Text(
                                'Tgl bang...',
                                style: TextStyle(
                                  fontFamily: 'Readex',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 75, 57, 239),
                                ),
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 12, 20, 4),
                              child: Text(
                                'KAMPOS.com – Penggunaan mobil listrik, khususnya hybrid, di Indonesia terus mengalami peningkatan seiring tingginya kesadaran masyarakat akan pentingnya menjaga lingkungan dan mengurangi emisi gas buang. Berdasarkan data Gabungan Industri Kendaraan Bermotor Indonesia (Gaikindo), mobil hybrid, baik itu hybrid electric vehicle (HEV) maupun plug-in hybrid electric vehicle (PHEV), masih mendominasi pasar mobil listrik di Indonesia pada 2023. Hal tersebut terlihat dari tingginya angkanya penjualan mobil Hybrid 41.571 unit atau 77,8 persen dari total penjualan kendaraan listrik keseluruhan pada periode Januari hingga Oktober 2023. Dari jajaran kendaraan hybrid, PT Toyoto Astro Mandidi (TAM) masih memimpin penjualan pada sektor itu dengan capaian 29.183 unit. Keberhasilan Toyoto dalam memimpin persaingan di pasar kendaraan hybrid pun disinyalir berkat kualitas produk kendaraan yang mereka hasilkan. Apa saja kendaraan hybrid dari Toyota tersebut? Berikut adalah ulasannya...',
                                style: TextStyle(
                                    fontFamily: "Readex",
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 87, 99, 108)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      height: 24,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Color.fromARGB(255, 224, 227, 231),
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 12),
                          child: Text('99+ Comments..',
                              style: TextStyle(
                                  fontFamily: "Readex",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 87, 99, 108))),
                        ),
                      ],
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 0, 16, 8),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x2F1D2429),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 12, 16, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'orang baik',
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 75, 57, 239),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '1 menit sebelum..',
                                        style: TextStyle(
                                          fontFamily: "Readex",
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 87, 99, 108),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 24,
                                    thickness: 2,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'wew ternyata dia sangat jahat hikz hikz...',
                                      style: TextStyle(
                                          fontFamily: "Readex",
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 87, 99, 108)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
