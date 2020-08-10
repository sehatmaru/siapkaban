package com.tam.siap.views.izinonline;

import java.io.File;
import java.io.IOException;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

import com.tam.siap.LayananStatus;
import com.tam.siap.components.TamCard;
import com.tam.siap.models.Dokumen;
import com.tam.siap.models.JenisLayanan;
import com.tam.siap.models.JenisPerusahaan;
import com.tam.siap.models.Layanan;
import com.tam.siap.models.Perusahaan;
import com.tam.siap.models.PicPerusahaan;
import com.tam.siap.models.SubJenisLayanan;
import com.tam.siap.models.SyaratAdministrasi;
import com.tam.siap.repos.DokumenRepository;
import com.tam.siap.repos.JenisLayananRepository;
import com.tam.siap.repos.JenisPerusahaanRepository;
import com.tam.siap.repos.LayananRepository;
import com.tam.siap.repos.PerusahaanRepository;
import com.tam.siap.repos.PicPerusahaanRepository;
import com.tam.siap.repos.SubJenisLayananRepository;
import com.tam.siap.repos.SyaratAdministrasiRepository;
import com.tam.siap.security.AuthService;
import com.tam.siap.security.UserService;
import com.tam.siap.utils.UIDGenerator;
import com.tam.siap.views.HomePageIzinOnline2;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.checkbox.Checkbox;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.polymertemplate.Id;
import com.vaadin.flow.component.textfield.EmailField;
import com.vaadin.flow.component.textfield.TextArea;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import com.vaadin.flow.dom.Element;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.VaadinSession;

@Route(value = "izinonline", layout = HomePageIzinOnline2.class)
public class IzinOnline extends VerticalLayout {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1613805910080579932L;

	@Id("txtjudulapp")
	Element txtjudulapp;

	// identitas perusahaan
	private TextField txtfnpwp = new TextField("NPWP Perusahaan / Pemohon (Wajib)");
	private TextField txtfnamapt = new TextField("Nama Perusahaan");
	private TextArea txtalamatpt = new TextArea("Alamat Perusahaan lengkap");

	// B. Identitas PIC
	private TextField picname = new TextField("Nama PIC");
	private TextField txtjabtan = new TextField("Jabatan");
	private EmailField txtemail = new EmailField("Email");
	TextField txtnohp = new TextField("No Handphone");

	private ComboBox<JenisPerusahaan> combofasilitas = new ComboBox<JenisPerusahaan>();
	private ComboBox<JenisLayanan> combojnslayanan = new ComboBox<JenisLayanan>();
	private ComboBox<SubJenisLayanan> combosubjenislayanan = new ComboBox<SubJenisLayanan>();

	private VerticalLayout docandconfirmation = new VerticalLayout();
	private VerticalLayout layconfirmation = new VerticalLayout();
	private Label[] lblDokumen = new Label[10];
	private Upload[] upload = new Upload[10];
	private MemoryBuffer[] membuff = new MemoryBuffer[10];
	private Button submit = new Button();
	private Perusahaan perusahaan = null;
	private PicPerusahaan picperusahaan = null;
	private Checkbox checbok = new Checkbox("Menyetujui");

	@Autowired
	private Environment env;

	@Autowired
	AuthService authService;

	@Autowired
	PerusahaanRepository perusahaanRepository;

	private List<JenisPerusahaan> jp;
	private List<JenisLayanan> jl;
	private List<SubJenisLayanan> sjl;

	@Autowired
	JenisPerusahaanRepository jenisPerusahaanRepository;

	@Autowired
	JenisLayananRepository jenisLayananRepository;

	@Autowired
	SubJenisLayananRepository subJenisLayananRepository;

	@Autowired
	SyaratAdministrasiRepository syaratAdministrasiRepository;

	@Autowired
	PicPerusahaanRepository picPerusahaanRepository;

	@Autowired
	DokumenRepository dokumenRepository;

	@Autowired
	LayananRepository layananRepository;

	@PostConstruct
	public void init() {
		// TODO Auto-generated constructor stub

		try {
			submit = new Button("Submit");
			submit.addClickListener(new ComponentEventListener<ClickEvent<Button>>() {

				@Override
				public void onComponentEvent(ClickEvent<Button> event) {

					if (checbok.getValue()) {
						Long id = UIDGenerator.getInstance().getUID();
						String nomor = "";
						Date tanggal = new Date();
						String fasilitas = combofasilitas.getValue().getDscp();
						String janjilayanan = "";
						String penerimadok = "";
						Long picstafid = null;
						Long pickplseksiid = null;
						Long pickplbidangid = null;
						Long pickplkantorid = null;
						String ket = "";
						ArrayList<SubJenisLayanan> subjenislayananid = new ArrayList<SubJenisLayanan>();
						subjenislayananid.add(combosubjenislayanan.getValue());

						simpan(id, txtfnpwp.getValue(), txtfnamapt.getValue(), combofasilitas.getValue().getId(),
								txtalamatpt.getValue(), picname.getValue(), txtjabtan.getValue(), txtemail.getValue(),
								txtnohp.getValue(), combojnslayanan.getValue().getId(), nomor, tanggal,
								combofasilitas.getValue().getDscp(), janjilayanan, penerimadok, picstafid,
								pickplseksiid, pickplbidangid, pickplkantorid, ket, subjenislayananid,
								LayananStatus.STATUS_BARU.getKey());

						// TODO Auto-generated method stub
//								content.removeAll();
//								content.add(new StatusLayananPage(layananRepository, perusahaan.getId()));	
					} else {
						Notification notification = new Notification("Anda herus menyetujui disclaimer", 3000,
								Position.MIDDLE);
						notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
						notification.open();
					}
				}
			});

			jp = (List<JenisPerusahaan>) jenisPerusahaanRepository.findAll();
			combofasilitas.setLabel("Jenis Perusahaan");
			combofasilitas.setItems(jp);
			combofasilitas.setItemLabelGenerator(JenisPerusahaan::getCodeDscp);

			jl = (List<JenisLayanan>) jenisLayananRepository.findAll();
			combojnslayanan.setLabel("Jenis Layanan");
			combojnslayanan.setItems(jl);
			combojnslayanan.setItemLabelGenerator(JenisLayanan::getDscp);

			combojnslayanan.addValueChangeListener(event -> {
				combosubjenislayanan.setLabel("Sub Jenis Layanan");
				long jpid = combofasilitas.getValue().getId();
				long jlid = combojnslayanan.getValue().getId();
				sjl = (List<SubJenisLayanan>) subJenisLayananRepository.findByJenisPerusahaanDanJenisLayanan(jpid,
						jlid);
				combosubjenislayanan.setItems(sjl);
				combosubjenislayanan.setItemLabelGenerator(SubJenisLayanan::getDscp);
				combosubjenislayanan.setEnabled(event.getValue() != null);
			});

			combofasilitas.addValueChangeListener(event -> {
				if (combofasilitas.getValue() == null || combojnslayanan.getValue() == null) {
//					Notification notification = new Notification("Silahkan pilih data Jenis perusahaan", 3000, Position.MIDDLE);
//					notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
//					notification.open();
				} else {
					combosubjenislayanan.setLabel("Sub Jenis Layanan");
					long jpid = combofasilitas.getValue().getId();
					long jlid = combojnslayanan.getValue().getId();
					sjl = (List<SubJenisLayanan>) subJenisLayananRepository.findByJenisPerusahaanDanJenisLayanan(jpid,
							jlid);
					combosubjenislayanan.setItems(sjl);
					combosubjenislayanan.setItemLabelGenerator(SubJenisLayanan::getDscp);
					combosubjenislayanan.setEnabled(event.getValue() != null);
				}
			});

			combosubjenislayanan.addValueChangeListener(event -> {
				combosubjenislayanan.setLabel("Sub Jenis Layanan");
				long sjlid = 0;
				try {
					long jpid = combofasilitas.getValue().getId();
					long jlid = combojnslayanan.getValue().getId();
					sjlid = combosubjenislayanan.getValue().getId();
				} catch (Exception e) {
					// TODO: handle exception
				}

				List<SyaratAdministrasi> syaratadministrasi = syaratAdministrasiRepository
						.findBySubjenislayananidOrderBySeq(sjlid);

				docandconfirmation.removeAll();
				layconfirmation.removeAll();
				if (syaratadministrasi != null && syaratadministrasi.size() > 0) {
					int i = 0;
					for (SyaratAdministrasi syarat : syaratadministrasi) {
						Label label = new Label(syarat.getDscp()+" (maks 1Mb)");
						MemoryBuffer buffer = new MemoryBuffer();
						Upload uploadfield = new Upload(buffer);
						docandconfirmation.add(label);
						docandconfirmation.add(uploadfield);
						membuff[i] = buffer;
						lblDokumen[i] = label;
						upload[i] = uploadfield;
						i++;
					}
				}

				TextArea txtdisclimer = new TextArea("Disclaimer");
				txtdisclimer.setValue(
						"Dengan melakukan pengisian pada Form Permohonan ini, kami menyatakan bahwa semua data dan dokumen yang kami berikan adalah lengkap, benar dan dapat dipertanggung jawabkan.");
				txtdisclimer.setReadOnly(true);
				txtdisclimer.setWidthFull();

				layconfirmation.add(txtdisclimer);

				layconfirmation.add(checbok);

				submit.setWidthFull();
				layconfirmation.add(submit);

			});

			loadPicPerusahaanAndPerusahaan();

		} catch (Exception e) {
			// e.printStackTrace();
		}
	}

	public IzinOnline() {
		setSizeFull();
		layconfirmation.setWidthFull();
		HorizontalLayout vl1 = new HorizontalLayout(identitasPerusahaan(), identitasPIC(), jenisLayanan());
		VerticalLayout vl2 = new VerticalLayout(vl1, layconfirmation);
		HorizontalLayout f1 = new HorizontalLayout(vl2, inputChekclist());
		add(f1);
	}

	private VerticalLayout identitasPerusahaan() {
		VerticalLayout lay = new VerticalLayout();
		lay.setWidthFull();
		txtfnpwp.setWidthFull();
		txtfnamapt.setWidthFull();
		combofasilitas.setWidthFull();
		txtalamatpt.setWidthFull();
		TamCard card = new TamCard("Identitas Perusahaan");
		card.addComp(txtfnpwp, txtfnamapt, combofasilitas, txtalamatpt);

		lay.add(card);

		return lay;
	}

	private VerticalLayout identitasPIC() {
		VerticalLayout lay = new VerticalLayout();
		lay.setWidthFull();
		picname.setWidthFull();
		txtjabtan.setWidthFull();
		txtemail.setWidthFull();
		txtnohp.setWidthFull();
		TamCard card = new TamCard("Identitas Pic");
		card.addComp(picname, txtjabtan, txtemail, txtnohp);

		lay.add(card);

		return lay;
	}

	private VerticalLayout inputChekclist() {
		VerticalLayout lay = new VerticalLayout();
		lay.setWidthFull();
		docandconfirmation.setWidthFull();
		TamCard card = new TamCard("Upload dokumen");
		card.addComp(docandconfirmation);

		lay.add(card);

		return lay;
	}

	private VerticalLayout jenisLayanan() {
		VerticalLayout lay = new VerticalLayout();
		lay.setWidthFull();
		combojnslayanan.setWidthFull();
		combosubjenislayanan.setWidthFull();
		TamCard card = new TamCard("Jenis Layanan");
		card.addComp(combojnslayanan, combosubjenislayanan);

		lay.add(card);

		return lay;
	}

	public void loadPicPerusahaanAndPerusahaan() {
		long userid = (long) VaadinSession.getCurrent().getAttribute(UserService.USERID);
		Optional<PicPerusahaan> picper = picPerusahaanRepository.findByUserid(userid);
		if (picper != null && picper.get() != null) {
			picperusahaan = picper.get();
			picname.setValue(picperusahaan.getNama());
			txtjabtan.setValue(picperusahaan.getJabatan());
			txtemail.setValue(picperusahaan.getEmail());
			txtnohp.setValue(picperusahaan.getHandphone());
			try {
				Optional<Perusahaan> per = perusahaanRepository.findById(picperusahaan.getPerusahaanid());
				if (per != null && per.get() != null) {
					perusahaan = per.get();
					txtfnpwp.setValue(perusahaan.getNpwpperusahaan());
					txtfnamapt.setValue(perusahaan.getNamaperusahaan());
					txtalamatpt.setValue(perusahaan.getAlamat());

					// jp = (List<JenisPerusahaan>) jenisPerusahaanRepository.findAll();
//					combofasilitas.setLabel("Jenis Perusahaan");
//					combofasilitas.setItems(jp);
					// combofasilitas.setItemLabelGenerator(JenisPerusahaan::getCodeDscp);
					// combofasilitas.setValue(perusahaan.getJenisPerusahaan());
					try {
						for (JenisPerusahaan jpo : jp) {
							if (jpo.getId() == perusahaan.getJenisPerusahaan().getId()) {
								combofasilitas.setValue(jpo);
							}
						}
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}

				} else {
					loadPenetapanLayanan();
				}
			} catch (Exception e) {
				loadPenetapanLayanan();
			}

		}
	}

	public void loadPenetapanLayanan() {
		try {
			long penetapanid = 1;
			jl = new ArrayList<JenisLayanan>();
			Optional<JenisLayanan> jenis = jenisLayananRepository.findById(penetapanid);
			jl.add(jenis.get());
			combojnslayanan.setLabel("Jenis Layanan");
			combojnslayanan.setItems(jl);
			combojnslayanan.setItemLabelGenerator(JenisLayanan::getDscp);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void simpan(long id, String npwpperusahaan, String namaperusahaan, Long jenisperushaanid, String alamat,
			String nama, String jabatan, String email, String handphone, Long jenislayananid, String nomor,
			Date tanggal, String fasilitas, String janjilayanan, String penerimadok, Long picstafid, Long pickplseksiid,
			Long pickplbidangid, Long pickplkantorid, String ket, ArrayList<SubJenisLayanan> subjenislayananid,
			String status) {

		Layanan layanan = new Layanan(id, npwpperusahaan, namaperusahaan, jenisperushaanid, alamat, nama, jabatan,
				email, handphone, jenislayananid, nomor, tanggal, fasilitas, janjilayanan, penerimadok, picstafid,
				pickplseksiid, pickplbidangid, pickplkantorid, ket, status, new Date(), new Date(), new Date(),
				new Date(), new Date());

		// Creating a hash set using constructor
		Set<SubJenisLayanan> hSet = new HashSet<SubJenisLayanan>(subjenislayananid);
		layanan.setSubJenisLayanan(hSet);
		if (perusahaan == null) {
			long perusid = UIDGenerator.getInstance().getUID();
			perusahaan = new Perusahaan(perusid, npwpperusahaan, namaperusahaan, jenisperushaanid, alamat);
			perusahaanRepository.save(perusahaan);
			picperusahaan.setPerusahaanid(perusid);
			picPerusahaanRepository.save(picperusahaan);
			layanan.setPerusahaanid(perusid);
			saveDocument(layanan.getId(), subjenislayananid.get(0).getId());
		} else {
			layanan.setPerusahaanid(perusahaan.getId());
			saveDocument(layanan.getId(), subjenislayananid.get(0).getId());
		}
		layananRepository.save(layanan);
		Notification notification = new Notification("Data telah tersimpan", 3000, Position.MIDDLE);
		notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
		notification.open();
	}

	public void saveDocument(long layananid, long subjenislayananid) {
		List<SyaratAdministrasi> syarat = syaratAdministrasiRepository
				.findBySubjenislayananidOrderBySeq(subjenislayananid);
		int i = 0;
		int seq = 1;
		List<Dokumen> docs = new ArrayList<Dokumen>();

		String filaPath = env.getProperty("layanan.document.path") + "\\" + layananid;

		for (SyaratAdministrasi s : syarat) {
			String fileName = "";
			try {
				fileName = membuff[i].getFileName();
				saveDocToServer(membuff[i], filaPath, fileName);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			UIDGenerator.getInstance().getUID();
			Dokumen d = new Dokumen(UIDGenerator.getInstance().getUID(), layananid, s.getId(),
					filaPath + "\\" + fileName, fileName, seq);
			dokumenRepository.save(d);
			i++;
			seq++;
			docs.add(d);
		}

	}

	private boolean saveDocToServer(MemoryBuffer mem, String filepath, String filename) throws IOException {
		// InputStream initialStream = new FileInputStream(new
		// File("src/main/resources/sample.txt"));
		boolean ok = true;
		File dir = new File(filepath);
		if (!dir.exists())
			dir.mkdirs();

		File targetFile = new File(filepath + "\\" + filename);

		java.nio.file.Files.copy(mem.getInputStream(), targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

		IOUtils.closeQuietly(mem.getInputStream());
		// System.out.println("File saved in : "+targetFile.getAbsolutePath());
		filepath = targetFile.getAbsolutePath();
		return ok;
	}

}
