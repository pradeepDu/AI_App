import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';


class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  String fullResponse = '''
Here are some reliable places to buy **replacement mesh filters for your earbuds**:

---

## 🛒 Recommended Products

* **[CCZ Dust‑Proof Steel Mesh (10 pairs)]()** – Self‑adhesive stainless steel mesh with a glue backing. Available in multiple sizes (\~4 mm–5 mm) for ₹770.
* **[TENNMAK Dust‑Proof Mesh (10 pairs)]()** – Designed for models like Sony WF‑1000XM4; durable steel filters, ₹1,783.
* **[Steel Mesh Filters (10 pairs)]()** – Larger packs, adhesive stainless steel filters via Ubuy, ₹2,093.

### [CCZ Dust‑Proof Steel Mesh (10 pairs)]()

#### Budget & precise

*₹770.91*

### [TENNMAK Dust‑Proof Mesh (10 pairs)]()

#### Sony-specific option

*₹1,783.15*

### [Steel Mesh Filters (10 pairs)]()

#### Bulk stainless mesh

*₹2,093.80*

---

## 🌐 Other Purchase Options

* **Amazon** sells **LBT 4 mm adhesive mesh packs**, compatible with brands like Skullcandy, Sennheiser, JBL → though currently out of stock ([amazon.com][1]).
* **Walmart** offers **steel mesh with glue backing** – a dust-proof solution .
* **Meesho (India)** sells 10 pcs of 4 mm self-adhesive steel mesh filters for ₹320–₹371 .
* **Ubuy India** provides 20 pc multi-size mesh sets—a versatile option ([ubuy.co.in][2]).
* **AliExpress/Alibaba** offer bulk earphone mesh filters at wholesale prices ([alibaba.com][3]).

---

## 🔍 Tips Before Buying

1. **Measure the nozzle size** — common diameters are **4 mm**, **4.5 mm**, **4.7 mm**, **5 mm**. Choose the closest match ([amazon.com][1]).
2. **Ensure adhesive backing** – filters with glue are easier to apply.
3. **Match material preference** – stainless steel is durable; metal-free for neutral sound.

---

## ✅ Quick DIY Installation

1. Clean the nozzle with isopropyl alcohol.
2. Peel the backing and place the adhesive mesh.
3. Press gently; reattach ear tip.
4. Optionally use tweezers (many kits include them) ([youtube.com][4]).

---

## 👍 Why Replacing the Mesh is Important

Without this mesh, your earbuds are exposed to dust, wax, and moisture—potentially harming the speaker and sound quality. Installing a new filter restores protection and preserves audio performance.

---

Let me know if you'd like direct links, help choosing the right size, or additional installation tips!

[1]: https://www.amazon.com/Headphone-Compatible-Skullcandy-Sennheiser-Technica/dp/B08JHLLBLQ?utm_source=chatgpt.com "Headphone Filter Mesh 4MM 4.5MM 4.7MM 5MM Earbuds Filters ..."
[2]: https://www.ubuy.co.in/product/FMBEKEK3M-20-pcsset-earbuds-filters-earphone-filter-mesh-earphone-protective-filters-earphone-accessories-4-sizes5mm?srsltid=AfmBOoqsWzqRLxE0-g8Fovkm_sdfTN_mL-5Vd8xglJHaOQtoG8CLNq_Q&utm_source=chatgpt.com "20 Pcs Set Earphone Filter Mesh - Protective Filters India | Ubuy"
[3]: https://www.alibaba.com/showroom/earphone-mesh-filter.html?utm_source=chatgpt.com "Earphone Mesh Filter(68+) - Alibaba.com"
[4]: https://www.youtube.com/watch?v=dXP8BPBawRU&utm_source=chatgpt.com "Guide: How to Replace Mesh Filters for MEE audio M6 PRO & MX ..."

''';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'perplexity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Markdown(data: fullResponse,
        shrinkWrap: true,),
      ],
    );
  }
}
